class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author
      t.string :post_title
      t.string :post_body

      t.timestamps
    end
  end
end
