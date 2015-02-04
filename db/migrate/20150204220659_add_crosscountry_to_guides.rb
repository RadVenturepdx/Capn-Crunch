class AddCrosscountryToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :crosscountry, :boolean
  end
end
