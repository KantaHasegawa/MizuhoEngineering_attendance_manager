class AttendancesController < ApplicationController



  def show
    @attendance  = Attendance.today_status(current_user)
  end

  def create
    @attendance  = Attendance.today_status(current_user)
    @attendance.attendance_time = Time.now
    @attendance.save
    redirect_to show
  end

  def update
    @attendance  = Attendance.today_status(current_user)
    if params[:attendance][:status] == 'in'
      @attendance.attendance_time = Time.now
    else
      @attendance.leaving_time = Time.now
      working_time = @attendance.leaving_time - @attendance.attendance_time
      working_time = working_time.to_i / 60
      @attendance.working_time = working_time
    end
    @attendance.save
    redirect_to show
  end


end
