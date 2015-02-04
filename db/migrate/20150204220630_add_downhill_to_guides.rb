class AddDownhillToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :downhill, :boolean
  end
end
