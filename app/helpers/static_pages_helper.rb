module StaticPagesHelper
  def home_guides
    guides = Guide.limit(3)
  end
end
