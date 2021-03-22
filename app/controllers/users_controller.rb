class UsersController < ApplicationController

  def index
    @users = User.where(admin: false)
  end

  def show
    @user = User.find(params[:id])
    @attendances = Attendance.search(@user.id,params[:year],params[:month])
    current_month_working_times = 0
    current_month_overtime_hours = 0
    @attendances.each do |attendance|
      current_month_working_times += attendance.working_times
      current_month_overtime_hours += attendance.overtime_hours
    end
    @current_month_working_times = current_month_working_times.divmod(60)
    @current_month_overtime_hours = current_month_overtime_hours.divmod(60)
    
  end
end
