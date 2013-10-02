class RemoveFieldEmailFromTableWorks < ActiveRecord::Migration
  def change
    remove_column :table_works, :email, :String
  end
end
