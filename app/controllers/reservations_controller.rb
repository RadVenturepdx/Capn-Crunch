class ReservationsController < ApplicationController
  def create
    @guide = Guide.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.guide = @guide

    if @reservation.valid?
      @reservation.save
      flash[:success] = "Your reservations has been submitted"
      redirect_to @guide
    else
      render 'guides/new_reservation'
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(
        :user_id,
        :guide_id,
        :time,
        :number_of_people,
        :note
      )
    end
end
