class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :pic_url
      t.references :users, index: true
      t.references :comments, index: true
      t.references :likes, index: true

      t.timestamps
    end
  end
end
