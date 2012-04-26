class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      t.integer :user_id, null:false
      t.string :kind, null:false

      t.timestamps
    end
  end
end
