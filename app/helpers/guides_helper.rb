module GuidesHelper
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
end
