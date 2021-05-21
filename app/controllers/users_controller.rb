class UsersController < ApplicationController
  require "rubyXL"
  require "rubyXL/convenience_methods/cell"
  require "rubyXL/convenience_methods/color"
  require "rubyXL/convenience_methods/font"
  require "rubyXL/convenience_methods/workbook"
  require "rubyXL/convenience_methods/worksheet"
  include CommonActions

  before_action :is_user_admin?

  def index
    @users = User.where(admin: false).page(params[:page]).per(13)
  end

  def table
    @user = User.find(params[:id])
    @attendances = Attendance.search(@user.id, params[:year], params[:month])
    current_year = params[:year] ||= Date.today.year
    current_month = params[:month] ||= Date.today.month
    workbook = RubyXL::Parser.parse("app/assets/template.xlsx")
    workbook.calc_pr.full_calc_on_load = true
    workbook.calc_pr.calc_completed = true
    workbook.calc_pr.calc_on_save = true
    workbook.calc_pr.force_full_calc = true
    worksheet = workbook[0]
    worksheet[0][5].change_contents(@user.name)
    worksheet[1][2].change_contents(current_year)
    worksheet[1][4].change_contents(current_month)
    @attendances.each do |attendance|
      y = attendance.day + 3
      worksheet[y][1].change_contents(attendance.wday)
      worksheet[y][2].change_contents(attendance.working_place)
      worksheet[y][3].change_contents(attendance.leaving_place)
      worksheet[y][4].change_contents(attendance.attendance_time.strftime("%H:%M"))
      worksheet[y][5].change_contents(attendance.leaving_time.strftime("%H:%M"))if attendance.leaving_time
      worksheet[y][6].change_contents(attendance.working_times) if attendance.working_times
      worksheet[y][7].change_contents(attendance.early_attendance) if attendance.early_attendance
      worksheet[y][8].change_contents(attendance.late_leaving) if attendance.late_leaving
      worksheet[y][9].change_contents(attendance.overtime_hours) if attendance.overtime_hours
      if attendance.rest_times
        worksheet[y][10].change_contents(attendance.rest_times)
      end
    end
    respond_to do |format|
      format.html
      format.xlsx do
        send_data workbook.stream.read,
          filename: "#{@user.name}(#{current_year}年#{current_month}月).xlsx".encode(Encoding::UTF_8)
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @working_places = @user.working_places
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to users_path
  end
end
