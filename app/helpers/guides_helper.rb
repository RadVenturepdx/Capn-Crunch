module GuidesHelper
  def hood_guides
    guides = Guide.where(:hood => true)
  end

  def bachelor_guides
    guides = Guide.where(:bachelor => true)
  end

  def whistler_guides
    guides = Guide.where(:whistler => true)
  end


  def location_string(hood, bachelor, whistler)
    comma = false
    str = ''
    if hood
      str << 'Mount Hood'
      comma = true
    end

    if bachelor
      if comma
        str << ', '
      end
      str << 'Mount Bachelor'
      comma = true
    end

    if whistler
      if comma
        str << ', '
      end
      str << 'Whistler'
    end

    return str
  end

  def sports_string(downhill, crosscountry, snowboard)
    comma = false
    str = ''
    if downhill
      str << 'Downhill Skiing'
      comma = true
    end

    if crosscountry
      if comma
        str << ', '
      end
      str << 'Crosscountry Skiing'
      comma = true
    end

    if snowboard
      if comma
        str << ', '
      end
      str << 'Snowboarding'
    end

    return str
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

  def replace_null_avail(avail)
    if avail.blank?
      avail.replace('Unavailable')
    end
  end
end
