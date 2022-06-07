class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @entry = Entry.find(params[:entry_id])
    @review.entry = @entry
    @review.user = current_user
    @review.save
    redirect_to forum_theme_path(@entry.theme)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
