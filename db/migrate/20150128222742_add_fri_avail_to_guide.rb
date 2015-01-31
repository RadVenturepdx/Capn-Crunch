class AddFriAvailToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :fri_avail, :string
  end
end
