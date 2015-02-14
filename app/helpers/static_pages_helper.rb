module StaticPagesHelper
  def home_guides
    guides = Guide.limit(3)
  end

  def hood_guides
    guides = Guide.where(:hood => true)
  end

  def bachelor_guides
    guides = Guide.where(:bachelor => true)
  end

  def whistler_guides
    guides = Guide.where(:whistler => true)
  end

  def about_guides
    guides = Guide.limit(6)
  end

  def top_guides(guides)
    top_guides = []
    guides.each do |guide|
      if guide.reviews.count > 0
        average_rating = guide.reviews.average(:rating)
        if top_guides.empty? || top_guides[0].reviews.average(:rating) < average_rating
          if !top_guides[1].nil?
            top_guides[2] = top_guides[1]
          end
          top_guides[1] = top_guides[0]
          top_guides[0] = guide
        elsif top_guides[1].nil? || top_guides[1].reviews.average(:rating) < average_rating
          top_guides[2] = top_guides[1]
          top_guides[1] = guide
        elsif top_guides[2].nil? || top_guides[2].reviews.average(:rating) < average_rating
          top_guides[2] = guide
        end
      end
    end
    return top_guides
  end

end
