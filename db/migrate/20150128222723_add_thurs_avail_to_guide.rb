class AddThursAvailToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :thurs_avail, :string
  end
end
