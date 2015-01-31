class AddMonAvailToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :mon_avail, :string
  end
end
