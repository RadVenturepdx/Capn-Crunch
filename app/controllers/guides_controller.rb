class GuidesController < ApplicationController
  def index
    @guides = Guide.all
  end

  def show
    @guide = Guide.find(params[:id])
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
    if @guide.save
      log_in @guide
      flash[:success] = "Welcome to Radventure"
      redirect_to @guide
    else
      render 'new'
    end
  end

  private

  def guide_params
    params.require(:guide).permit(:user_id,
                                  :location,
                                  :specialty,
                                  :rate)
  end

end