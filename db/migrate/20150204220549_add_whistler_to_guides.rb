class AddWhistlerToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :whistler, :boolean
  end
end
