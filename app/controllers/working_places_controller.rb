class WorkingPlacesController < ApplicationController
  include CommonActions
  before_action :is_user_admin?

  def new
    @working_place = WorkingPlace.new
    @relationship = @working_place.relationships.build
    @users = User.where(admin: false)
  end

  def index
    @working_places = WorkingPlace.all.page(params[:page]).per(13)
  end

  def show
    @working_place = WorkingPlace.find(params[:id])
    @users = @working_place.users
  end

  def create
    @working_place = WorkingPlace.new(working_place_params)
    unless Geocoder.search(@working_place.address).empty?
      if params[:working_place][:relationships_attributes]
        if is_names_unique(params[:working_place][:relationships_attributes])
          if @working_place.save
            flash[:notice] = "勤務地を登録しました"
            redirect_to controller: :working_places, action: :show, id: @working_place.id
          else
            flash[:alert] = "入力した住所は既に登録されています"
            redirect_to new_working_place_path
          end
        else
          flash[:alert] = "名前が重複しています"
          redirect_to new_working_place_path
        end
      else
        if @working_place.save
          flash[:notice] = "勤務地を登録しました"
          redirect_to controller: :working_places, action: :show, id: @working_place.id
        else
          flash[:alert] = "入力した住所は既に登録されています"
          redirect_to new_working_place_path
        end
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
      if params[:working_place][:relationships_attributes]
        if is_names_unique(params[:working_place][:relationships_attributes])
          @working_place.update(working_place_params)
          if @working_place.save
            flash[:notice] = "勤務地を編集しました"
            redirect_to working_place_path
          else
            flash[:alert] = "入力に不備があります"
            redirect_to edit_working_place_path
          end
        else
          flash[:alert] = "名前が重複しています"
          redirect_to edit_working_place_path
        end
      else
        @working_place.update(working_place_params)
        if @working_place.save
          flash[:notice] = "勤務地を編集しました"
          redirect_to working_place_path
        else
          flash[:alert] = "入力に不備があります"
          redirect_to edit_working_place_path
        end
      end
    else
      flash[:alert] = "正しい住所を入力してください"
      redirect_to edit_working_place_path
    end
  end

  def destroy
    @working_place = WorkingPlace.find(params[:id])
    @working_place.destroy
    flash[:notice] = "勤務地を削除しました"
    redirect_to working_places_path
  end

  private

  def is_names_unique(relationships)
    names = []
    relationships.each do |r|
      names.push(r[1][:user_id]) if r[1][:_destroy] == "false"
    end
    names == names.uniq
  end

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
      ],
    )
  end
end
