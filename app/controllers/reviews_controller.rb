class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.new(reviews_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.user = current_user
    if (@review.save)
      redirect_to @product
    else
      render 'products/show'
    end

  end
  def destroy
    @review = Review.find_by(id: params[:id])
    @product = Product.find(params[:product_id])
    @review.destroy
    render 'products/show'
  end
  private
  def reviews_params
    reviews_params = {
    description: params[:review][:description],
    rating: params[:review][:rating]
  }
  end
end