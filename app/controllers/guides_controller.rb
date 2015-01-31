class GuidesController < ApplicationController
  def index
    @guides = Guide.all
  end

  def show
    @guide = Guide.find(params[:id])
    @reviews = @guide.reviews.paginate(page: params[:page])
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
                                  :rate,
                                  :sun_avail,
                                  :mon_avail,
                                  :tues_avail,
                                  :wed_avail,
                                  :thurs_avail,
                                  :fri_avail,
                                  :sat_avail)
  end

end
