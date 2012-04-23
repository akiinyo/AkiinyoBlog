class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, nll: false
      t.string :email, null: false
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end
  end
end
