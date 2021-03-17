class AttendancesController < ApplicationController



  def show
    @attendance  = Attendance.today_status(current_user)
    @working_places = current_user.working_places
  end

  def create
    # binding.pry
    if is_current_position_within_working_places(current_user.working_places,params[:attendance][:lat],params[:attendance][:lng]) == true
      @attendance  = Attendance.today_status(current_user)
      @attendance.attendance_time = Time.now
      @attendance.working_place = get_near_place(current_user.working_places,params[:attendance][:lat],params[:attendance][:lng])
      @attendance.save
      flash[:notice] = "出勤しました"
      redirect_to controller: :attendances, action: :show, id: @attendance.id
    else
      flash[:alert] = "指定された勤務地に向かってください"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if is_current_position_within_working_places(current_user.working_places,params[:attendance][:lat],params[:attendance][:lng]) == true
      @attendance  = Attendance.today_status(current_user)
        @attendance.leaving_time = Time.now
        working_time = @attendance.leaving_time - @attendance.attendance_time
        working_time = working_time.to_i / 60
        @attendance.working_time = working_time
      @attendance.save
      flash[:notice] = "退勤しました"
      redirect_to controller: :attendances, action: :show, id: @attendance.id
    else
      flash[:alert] = "指定された勤務地に向かってください"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def is_current_position_within_working_places(working_places,lat,lng)
    distances = []
    working_places.each do |working_place|
      distance = working_place.distance_from([lat,lng])
      distances.push(distance)
    end
    if distances.any? {|v| v < 1}
      return true
    else
      return false
    end
  end

      def get_near_place(working_places,lat,lng)
        distances = []
        working_places.each do |working_place|
          distance = working_place.distance_from([lat,lng])
          distances.push(distance)
        end
        min = distances.min
        index = distances.index(min)
        near_place = working_places[index]

        binding.pry

        return near_place.address
      end

end
