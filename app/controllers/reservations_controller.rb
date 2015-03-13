class ReservationsController < ApplicationController
  def create
    @guide = Guide.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.guide = @guide
    @reservation.payment_status = 'Pending'
    @reservation.price = @guide.rate

    if @reservation.valid?
      @reservation.save
      flash[:success] = "Your reservation has been submitted"
      redirect_to payment_path
    else
      render 'guides/new_reservation'
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(
        :user_id,
        :guide_id,
        :price,
        :location,
        :time,
        :payment_status,
        :price,
        :number_of_people,
        :note
      )
    end
end
