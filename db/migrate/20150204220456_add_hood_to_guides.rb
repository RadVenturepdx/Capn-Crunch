class AddHoodToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :hood, :boolean
  end
end
