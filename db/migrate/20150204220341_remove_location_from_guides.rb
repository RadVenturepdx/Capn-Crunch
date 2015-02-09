class RemoveLocationFromGuides < ActiveRecord::Migration
  def change
    remove_column :guides, :location, :string
  end
end
