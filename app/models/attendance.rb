class Attendance < ApplicationRecord
  belongs_to :user
  class << self

    def today_status(user)
    date = Date.today
    params = {user_id: user.id,date: Date.today}
    self.find_by(params) || self.new(params)
    end
  end

    def working_status
      case[!!attendance_time, !!leaving_time]
      when [false, false]
      :not_arrived # 未出社
      when [true, false]
      :working # 勤務中
      when [true, true]
      :left # 退社済
      end

end
end
