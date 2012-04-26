class CreatePuts < ActiveRecord::Migration
  def change
    create_table :puts do |t|
      t.integer :button_id, null:false

      t.timestamps
    end
  end
end
