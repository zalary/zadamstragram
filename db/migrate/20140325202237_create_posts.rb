class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :pic_url
      t.references :user, index: true
      t.references :comment, index: true
      t.references :like, index: true

      t.timestamps
    end
  end
end
