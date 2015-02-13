class CitiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  def index
    @cities = City.all
  end

  def show
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = City.new(city_params)
    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_path, notice: 'City was successfully destroyed.' }

    end
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end
end
