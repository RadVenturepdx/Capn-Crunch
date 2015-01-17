class ChangeProfileFormatInUsers < ActiveRecord::Migration
  def change
    change_column :users, :profile, :text
  end
end
