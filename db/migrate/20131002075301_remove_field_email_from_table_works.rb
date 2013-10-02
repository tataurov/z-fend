class RemoveFieldEmailFromTableWorks < ActiveRecord::Migration
  def change
    remove_column :works, :email, :String
  end
end
