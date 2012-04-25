class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, null:false
      t.string :blog_title
      t.string :message

      t.timestamps
    end
  end
end
