class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :about
      t.string :category
      t.belongs_to :user
      t.timestamps
    end
    add_attachment :posts, :image
  end

end
