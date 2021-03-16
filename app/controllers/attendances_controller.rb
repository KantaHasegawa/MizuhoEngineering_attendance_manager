class AttendancesController < ApplicationController



  def show
    @attendance  = Attendance.today_status(current_user)
    @working_places = current_user.working_places
  end

  def create
    # binding.pry
    @attendance  = Attendance.today_status(current_user)
    @attendance.attendance_time = Time.now
    @attendance.save
    redirect_to controller: :attendances, action: :show, id: @attendance.id
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
    redirect_to controller: :attendances, action: :show, id: @attendance.id
  end


end
