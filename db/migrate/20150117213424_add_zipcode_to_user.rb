class AddZipcodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :zipcode, :string
  end
end
