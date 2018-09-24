class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.text :owner
      t.integer :guest_user_id
      t.integer :user_id
      t.string :slug

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
