class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    params_new = params.require(:review).permit(:content, :rating)
    @review = Review.new(params_new)
    @review.restaurant_id = params[:restaurant_id]
    if @review.save
      redirect_to restaurant_path(Restaurant.find(@review.restaurant), notice: "thank you for your review!"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
