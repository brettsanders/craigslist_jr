class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :price
      t.belongs_to :category


      t.timestamps
    end
  end
end
