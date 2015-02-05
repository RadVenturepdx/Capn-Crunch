class AddWedAvailToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :wed_avail, :string
  end
end
