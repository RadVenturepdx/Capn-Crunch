class AddBachelorToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :bachelor, :boolean
  end
end
