class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.string :email
      t.string :url
      t.string :site_url
      t.integer :pages_count
      t.string :type
      t.datetime :date

      t.timestamps
    end
  end
end
