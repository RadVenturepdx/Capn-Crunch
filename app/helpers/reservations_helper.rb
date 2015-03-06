module ReservationsHelper
  def locations
    [
      ['Mount Bachelor', 'Mount Bachelor'],
      ['Mount Hood', 'Mount Hood'],
      ['Whistler', 'Whistler']
    ]
  end

  def get_reservation(user_id, guide_id)
    user_res = Reservation.find_by(user_id: user_id)
    guide_res = Reservation.find_by(guide_id)
  end
end
