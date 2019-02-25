class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    @review = Review.create(review_params)
    @review.user = current_user
    @review.product_id = @product.id

    if @review.save!
      redirect_to product_path(@product.id)
    else
      render product_path(@product.id)
    end
  end

  def destroy
    @review = Review.find params[:review_id]
    @review.destroy
    redirect_to [:product], notice: 'Review deleted!'
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id,
      :id
    )
  end

end
