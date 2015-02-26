class AddProfileToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :profile, :text
  end
end
