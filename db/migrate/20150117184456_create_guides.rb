class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :location
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
