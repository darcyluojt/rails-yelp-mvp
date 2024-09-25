class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [ :show, :edit, :update, :destroy ]
  # /restaurants
  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new, status: :unprocessable_entity
      end
  end

  # /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # /restaurants/:id/edit
  def edit
  end

  def show
    @review = Review.new
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant), notice: "Restaurant was updated."
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: "Restaurant was deleted."
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :phone_number)
  end
end
