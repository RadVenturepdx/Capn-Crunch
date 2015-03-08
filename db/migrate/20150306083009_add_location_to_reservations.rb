class AddLocationToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :location, :string
  end
end
