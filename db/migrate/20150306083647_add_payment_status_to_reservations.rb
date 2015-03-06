class AddPaymentStatusToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :payment_status, :string
  end
end
