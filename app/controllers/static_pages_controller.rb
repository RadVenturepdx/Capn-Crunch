class StaticPagesController < ApplicationController
  def home
    @guides = Guide.all
  end
end
