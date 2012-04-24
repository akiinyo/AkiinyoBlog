class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id, null: false
      t.string :name, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
