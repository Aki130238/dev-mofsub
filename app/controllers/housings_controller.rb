class HousingsController < ApplicationController

  def index
    @housings = Housing.all
  end

  def new
    @housing = Housing.new
    2.times { @housing.near_stations.build }
  end

  def create
    @housing = Housing.create(params_housing)
    #3.times { @housing.articles.build }(params[:housing])
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
    @housing = Housing.find(params[:id])
  end

  def edit
    @housing = Housing.find(params[:id])
  end

  def update
    @housing = Housing.find(params[:id])
  end

  def destroy
    @housing = Housing.find(params[:id])
    @housing.destroy
    redirect_to housings_path, notice:"userを削除しました！"
  end

  private

  def params_housing
    params.require(:housing).permit(
      :build,
      :rent,
      :add,
      :year,
      :remarks,
      near_stations_attributes:[
        :line,
        :station,
        :walk])
  end
end
