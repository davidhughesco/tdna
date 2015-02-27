class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :area_name
      t.integer :area_id
      t.integer :order_id

      t.timestamps
    end
  end
end
