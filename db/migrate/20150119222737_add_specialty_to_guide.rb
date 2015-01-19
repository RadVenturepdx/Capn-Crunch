class AddSpecialtyToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :specialty, :string
  end
end
