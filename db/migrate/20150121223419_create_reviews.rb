class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user, index: true
      t.references :guide, index: true

      t.timestamps
    end
    add_index :reviews, [:guide_id, :created_at]
  end
end
