class RemoveSpecialtyFromGuides < ActiveRecord::Migration
  def change
    remove_column :guides, :specialty, :string
  end
end
