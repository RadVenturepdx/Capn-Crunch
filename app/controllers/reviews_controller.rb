class ReviewsController < ApplicationController

  private

  def review_params
    params.require(:review).permit(:user_id,
                                   :guide_id,
                                   :content,
                                   :rating )
  end
end
