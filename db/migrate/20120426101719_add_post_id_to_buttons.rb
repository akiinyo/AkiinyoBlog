class AddPostIdToButtons < ActiveRecord::Migration
  def change
    add_column :buttons, :post_id, :integer
  end
end
