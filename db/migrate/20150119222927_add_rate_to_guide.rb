class AddRateToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :rate, :float
  end
end
