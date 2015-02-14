class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true
      t.references :guide, index: true

      t.timestamps
    end
    add_index :reservations, [:guide_id, :created_at]
    add_index :reservations, [:user_id, :created_at]
  end
end
