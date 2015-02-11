module StaticPagesHelper
  def home_guides
    guides = Guide.limit(3)
  end

  def local_guides(location)
    guides = Guide.where(:location => location)
  end

  def about_guides
    guides = Guide.limit(6)
  end
end
