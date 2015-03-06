class ReviewsController < ApplicationController
  include ReservationsHelper

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new(review_params)
    @guide = Guide.find(params[:guide_id])
    @review.user_id = current_user.id
    @review.guide_id = params[:guide_id]
    if @review.save
      flash[:success] = "Review submitted!"
      redirect_to :controller => 'users', :action => 'transaction_history', :id => current_user.id
    else
      render 'users/review'
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id,
                                   :guide_id,
                                   :content,
                                   :rating,
                                   :title)
  end
end
