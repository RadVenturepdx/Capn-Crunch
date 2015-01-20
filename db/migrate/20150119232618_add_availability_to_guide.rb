class AddAvailabilityToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :availability, :boolean, array: true, default: [false, false, false, false, false, false, false]
  end
end
