module CommonActions
  extend ActiveSupport::Concern

  def is_user_admin?
    redirect_to root_path if current_user.admin == false
  end
end
