class WorkingPlacesController < ApplicationController
  def new
    @working_place = WorkingPlace.new
    @relationship = @working_place.relationships.build
    @users = User.where(admin: false)
  end

  def index
    @working_places = WorkingPlace.all
  end

  def show
    @working_place = WorkingPlace.find(params[:id])
    @users = @working_place.users
  end

  def create
    @working_place = WorkingPlace.new(working_place_params)
    @working_place.save
    redirect_to working_places_path
  end

  def edit
    @working_place = WorkingPlace.find(params[:id])
    @users = User.where(admin: false)
  end

  def update
    @working_place = WorkingPlace.find(params[:id])
    @working_place.update(working_place_params)
    @working_place.save
    redirect_to working_place_path
  end

  def destroy
    @working_place = WorkingPlace.find(params[:id])
    @working_place.destroy
    redirect_to working_places_path
  end


  private

  def working_place_params
    params.require(:working_place).permit(
      :addres,
      relationships_attributes: [
        :id,
        :user_id,
        :working_place_id,
        :_destroy,
      ]
    )
  end
end
