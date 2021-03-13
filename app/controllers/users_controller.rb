class UsersController < ApplicationController

  def index
    @users = User.where(admin: false)
  end

  def show
    @user = User.find(params[:id])
  end
end
