class AddSunAvailToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :sun_avail, :string
  end
end
