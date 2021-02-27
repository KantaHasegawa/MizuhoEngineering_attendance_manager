class AttendancesController < ApplicationController



  def show
    @attendance  = Attendance.today_status(current_user)
  end

  def create
    @attendance  = Attendance.today_status(current_user)
    @attendance.attendance_time = Time.now
    @attendance.save
  end

  def update
    @attendance  = Attendance.today_status(current_user)
    if params[:attendance][:status] == 'in'
      @attendance.attendance_time = Time.now
    else
      @attendance.leaving_time = Time.now
    end
    @attendance.save
  end


end
