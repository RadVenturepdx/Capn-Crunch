class AddTimeAndNumberOfPeopleAndNoteToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :time, :string
    add_column :reservations, :number_of_people, :integer
    add_column :reservations, :note, :string
  end
end
