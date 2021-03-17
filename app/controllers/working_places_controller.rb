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
    unless Geocoder.search(@working_place.address).empty?
      if @working_place.save
        flash[:success] = "勤務地を登録しました"
        redirect_to controller: :working_places, action: :show, id: @working_place.id
      else
        flash[:alert] = "入力した住所は既に登録されています"
        redirect_to new_working_place_path
      end
    else
      flash[:alert] = "正しい住所を入力してください"
      redirect_to new_working_place_path
    end
  end

  def edit
    @working_place = WorkingPlace.find(params[:id])
    @users = User.where(admin: false)
  end

  def update
    @working_place = WorkingPlace.find(params[:id])
      unless Geocoder.search(@working_place.address).empty?
      @working_place.update(working_place_params)
      if @working_place.save
        flash[:success] = "勤務地を編集しました"
        redirect_to working_place_path
      else
        flash[:alert] = "入力した住所は既に登録されています"
        redirect_to new_working_place_path
      end
    else
      flash[:alert] = "正しい住所を入力してください"
      redirect_to new_working_place_path
    end

  end

  def destroy
    @working_place = WorkingPlace.find(params[:id])
    @working_place.destroy
    redirect_to working_places_path
  end


  private

  def working_place_params
    params.require(:working_place).permit(
      :address,
      :latitude,
      :longitude,
      relationships_attributes: [
        :id,
        :user_id,
        :working_place_id,
        :_destroy,
      ]
    )
  end
end
