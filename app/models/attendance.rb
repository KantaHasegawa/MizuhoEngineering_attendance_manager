class Attendance < ApplicationRecord
    validates_presence_of(:attendance_time)
    validates_presence_of(:working_place)
    validates_presence_of(:date)
    validates_presence_of(:year)
    validates_presence_of(:month)
    validates_presence_of(:day)
    validates_presence_of(:wday)
    validates_uniqueness_of(:date, scope: :user_id)
  belongs_to :user
  class << self
    def today_status(user)
      if self.find_by(user:user.id,leaving_time:nil)
        return self.find_by(user:user.id,leaving_time:nil)
      end
      date = Date.today
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
      params = { user_id: user.id, date: date, year: date.year, month: date.month, day: date.day, wday: wday }
      self.find_by(params) || self.new(params)
    end
  end

  def working_status
    case [!!attendance_time, !!leaving_time]
    when [false, false]
      :not_arrived # 未出社
    when [true, false]
      :working # 勤務中
    when [true, true]
      :left # 退社済
    end
  end

  def calculation_early_attendance
    attendance_regular_working_time = Time.new(self.year, self.month, self.day, 8, 00)
    if attendance_regular_working_time - self.attendance_time > 0
      if attendance_regular_working_time > self.leaving_time
        self.early_attendance = (self.leaving_time - self.attendance_time) / 60
      else
        self.early_attendance = (attendance_regular_working_time - self.attendance_time) / 60
      end
    else
      self.early_attendance = 0
    end
  end

  def calculation_late_leaving
    leaving_regular_working_time = Time.new(self.year, self.month, self.day, 17, 00)
    if self.leaving_time - leaving_regular_working_time > 0
      if leaving_regular_working_time < self.attendance_time
        self.late_leaving = (self.leaving_time - self.attendance_time) / 60
      else
        self.late_leaving = (self.leaving_time - leaving_regular_working_time) / 60
      end
    else
      self.late_leaving = 0
    end
  end

  def calculation_working_times
    working_times = (self.leaving_time - self.attendance_time).to_i / 60
    self.working_times = working_times - self.early_attendance - self.late_leaving
  end

  def self.search(user, year, month)

    if year.blank? || month.blank?
      return Attendance.where(user: user, year: Date.today.year, month: Date.today.month).order(:day)
    else
      return Attendance.where(user: user, year: year, month: month).order(:day)
    end
  end
end
