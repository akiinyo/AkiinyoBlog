class AddTwitterIconUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_icon_url, :string
  end
end
