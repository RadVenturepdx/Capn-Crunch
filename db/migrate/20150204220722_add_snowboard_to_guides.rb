class AddSnowboardToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :snowboard, :boolean
  end
end
