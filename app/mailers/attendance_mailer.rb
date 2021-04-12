class AttendanceMailer < ApplicationMailer
  def attendance_email
      @user = params[:user]
      @attendance = params[:attendance]
      mail(to: ENV['ADMIN_USER_MAIL'], subject: "#{@user.name}さんが出勤しました")
  end

  def leaving_email
      @user = params[:user]
      @attendance = params[:attendance]
      mail(to: ENV['ADMIN_USER_MAIL'], subject: "#{@user.name}さんが退勤しました")
  end
end
