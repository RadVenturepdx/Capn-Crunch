module ReviewsHelper
  def overall_rating_stars(reviews)
    totalRating = 0
    for review in reviews
      totalRating += review.rating
    end
    avgRating = totalRating / reviews.size
    ratingStars = avgRating % 5
  end
end
