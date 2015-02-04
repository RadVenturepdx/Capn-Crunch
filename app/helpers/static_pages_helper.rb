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
end
