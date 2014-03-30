class CreateWorksTypes < ActiveRecord::Migration
  def change
    create_table :work_types_works do |t|
      t.integer :work_type_id
      t.integer :work_id
    end
  end
end
