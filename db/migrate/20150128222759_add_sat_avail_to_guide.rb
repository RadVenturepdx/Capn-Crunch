class AddSatAvailToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :sat_avail, :string
  end
end
