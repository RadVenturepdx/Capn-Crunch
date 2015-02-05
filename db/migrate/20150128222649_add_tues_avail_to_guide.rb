class AddTuesAvailToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :tues_avail, :string
  end
end
