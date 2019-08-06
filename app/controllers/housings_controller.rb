class HousingsController < ApplicationController
  before_action :set_housing, only: [:show, :edit, :update, :destroy]

  def index
    @housings = Housing.all
  end

  def new
    @housing = Housing.new
    2.times { @housing.near_stations.build }
  end

  def create
    @housing = Housing.new(params_housing)
    if params[:back]
      render 'new'
    else
      if @housing.save
        redirect_to housing_path(@housing.id)
      else
        render 'new'
      end
    end
  end

  def show
  end

  def edit
    @housing.near_stations.new
  end

  def update
    if @housing.update(params_housing)
      redirect_to housings_path, notice:"変更しました！"
    else
      render :edit
    end
  end

  def destroy
    @housing.destroy
    redirect_to housings_path, notice:"削除しました！"
  end

  private

  def set_housing
    @housing = Housing.find(params[:id])
  end

  def params_housing
    params.require(:housing).permit(
      :build,
      :rent,
      :add,
      :year,
      :remarks,
      near_stations_attributes:[
        :id,
        :line,
        :station,
        :walk])
  end
end
