class AttendancesController < ApplicationController
  include CommonActions
  before_action :is_user_admin?, only: [:edit]

  def new
    if current_user.admin == true
        @attendance = Attendance.new
        @users = User.where(admin: false)
        @working_places = WorkingPlace.select("address")
    end
  end

  def show
    @attendance = Attendance.today_status(current_user)
    if @attendance.working_status == :left
      flash[:alert] = "今日の勤務は終了しています"
      redirect_to controller: :attendances, action: :new, id: @attendance.id
    end
    @working_places = current_user.working_places
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def create
    if current_user.admin == true
        @attendance = Attendance.new(attendance_params)
        unless attendance_params['attendance_time'].blank?
            attendance_time = attendance_params['attendance_time']
            year = attendance_time[0..3].to_i
            month = attendance_time[5..6].to_i
            day = attendance_time[8..9].to_i
            date = Date.new(year,month,day)
            wday = case date.wday
            when 0
                "日"
            when 1
                "月"
            when 2
                "火"
            when 3
                "水"
            when 4
                "木"
            when 5
                "金"
            when 6
                "土"
            end
            @attendance.year = year
            @attendance.month = month
            @attendance.day = day
            @attendance.wday = wday
            @attendance.date = date
        end
        unless attendance_params['leaving_time'].blank?
            @attendance.calculation_early_attendance
            @attendance.calculation_late_leaving
            @attendance.calculation_working_times
            @attendance.overtime_hours = @attendance.late_leaving + @attendance.early_attendance
        end
        if  @attendance.save
            flash[:notice] = "登録しました"
            redirect_to new_attendance_path
        else
            flash[:alert] = "失敗しました"
            redirect_to new_attendance_path
        end
    else
        if is_current_position_within_working_places(current_user.working_places, params[:attendance][:lat], params[:attendance][:lng]) == true
        @attendance = Attendance.today_status(current_user)
        @attendance.attendance_time = Time.now
        @attendance.working_place = get_near_place(current_user.working_places, params[:attendance][:lat], params[:attendance][:lng])
        @attendance.save
        AttendanceMailer.with(user: current_user,attendance: @attendance).attendance_email.deliver_later
        flash[:notice] = "出勤しました"
        redirect_to controller: :attendances, action: :show, id: @attendance.id
        else
        flash[:alert] = "指定された勤務地に向かってください"
        redirect_back(fallback_location: "attendance/show")
    end
  end

  end

  def update
    if current_user.admin == true
      @attendance = Attendance.find(params[:id])
      @attendance.update(attendance_params)
      unless attendance_params['leaving_time'].blank?
        @attendance.calculation_early_attendance
        @attendance.calculation_late_leaving
        @attendance.calculation_working_times
        @attendance.overtime_hours = @attendance.late_leaving + @attendance.early_attendance
      end
      @attendance.save
      flash[:notice] = "勤務データを編集しました"
      redirect_to controller: :users, action: :table, id: @attendance.user_id
    else
      if is_current_position_within_working_places(current_user.working_places, params[:attendance][:lat], params[:attendance][:lng]) == true
        @attendance = Attendance.today_status(current_user)
        @attendance.leaving_place = get_near_place(current_user.working_places, params[:attendance][:lat], params[:attendance][:lng])
        @attendance.leaving_time = Time.now
        @attendance.calculation_early_attendance
        @attendance.calculation_late_leaving
        @attendance.calculation_working_times
        @attendance.overtime_hours = @attendance.late_leaving + @attendance.early_attendance
        @attendance.save
        AttendanceMailer.with(user: current_user,attendance: @attendance).leaving_email.deliver_later
        flash[:notice] = "退勤しました"
        redirect_to controller: :attendances, action: :new
      else
        flash[:alert] = "指定された勤務地に向かってください"
        redirect_back(fallback_location: "attendance/show")
      end
    end
  end

  def destroy
      @attendance = Attendance.find(params[:id])
      @attendance.destroy
      flash[:notice] = "勤務データを削除しました"
      redirect_to controller: :users, action: :table, id: @attendance.user_id
  end

  private

  def is_current_position_within_working_places(working_places, lat, lng)
    distances = []
    working_places.each do |working_place|
      distance = working_place.distance_from([lat, lng])
      distances.push(distance)
    end


    if distances.any? { |v| v < 1 }
      return true
    else
      return false
    end
  end

  def get_near_place(working_places, lat, lng)
    distances = []
    working_places.each do |working_place|
      distance = working_place.distance_from([lat, lng])
      distances.push(distance)
    end
    min = distances.min
    index = distances.index(min)
    near_place = working_places[index]
    return near_place.address
  end

  def attendance_params
    params.require(:attendance).permit(
    :user_id,
    :year,
    :month,
    :day,
    :wday,
    :attendance_time,
    :leaving_time,
    :early_attendance,
    :late_leaving,
    :rest_times,
    :working_times,
    :overtime_hours,
    :working_place,
    :leaving_place,
    )
  end
end
