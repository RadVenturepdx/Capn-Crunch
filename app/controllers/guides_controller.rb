class GuidesController < ApplicationController
  include SessionsHelper
  include GuidesHelper
  before_action :logged_in_user, only: [
    :new,
    :edit,
    :update,
    :new_reservation,
    :create_reservation
  ]
  before_action :correct_user,   only: [:new]
  before_action :correct_guide,  only: [:edit, :update]

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

    @guide.user_id = current_user.id

    replace_null_avail(@guide.sun_avail)
    replace_null_avail(@guide.mon_avail)
    replace_null_avail(@guide.tues_avail)
    replace_null_avail(@guide.wed_avail)
    replace_null_avail(@guide.thurs_avail)
    replace_null_avail(@guide.fri_avail)
    replace_null_avail(@guide.sat_avail)

    if @guide.save
      user = current_user
      log_out
      log_in user
      flash[:success] = "Congratulations! You are now a guide"
      redirect_to @guide
    else
      render 'new'
    end
  end

  def edit
    @guide = Guide.find(params[:id])
  end

  def update
    @guide = Guide.find(params[:id])

    @guide.user_id = current_user.id

    replace_null_avail(@guide.sun_avail)
    replace_null_avail(@guide.mon_avail)
    replace_null_avail(@guide.tues_avail)
    replace_null_avail(@guide.wed_avail)
    replace_null_avail(@guide.thurs_avail)
    replace_null_avail(@guide.fri_avail)
    replace_null_avail(@guide.sat_avail)

    if @guide.update(guide_params)
      flash[:success] = 'Guide profile has been updated'
      redirect_to @guide
    else
      render 'edit'
    end
  end

  def mtbachelor
  end

  def mthood
  end

  def mtwhistler
  end

  def new_reservation
    @guide = Guide.find(params[:id])
    @reservation = Reservation.new
  end

  private
    def guide_params
      params.require(:guide).permit(
        :user_id,
        :hood,
        :bachelor,
        :whistler,
        :downhill,
        :crosscountry,
        :snowboard,
        :rate,
        :profile,
        :sun_avail,
        :mon_avail,
        :tues_avail,
        :wed_avail,
        :thurs_avail,
        :fri_avail,
        :sat_avail
      )
    end
end
