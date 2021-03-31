module CommonActions
  extend ActiveSupport::Concern

  def is_user_admin?
    if user_signed_in?
      redirect_to root_path if current_user.admin == false
    else
      redirect_to root_path
    end
  end
end
