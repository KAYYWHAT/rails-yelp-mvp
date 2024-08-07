class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'restaurant was successfully created.'
    else
      render :new
    end
  end

  private

  # Strong parameters for restaurant
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :rating)
  end
end
