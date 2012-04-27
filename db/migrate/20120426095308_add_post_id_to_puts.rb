class AddPostIdToPuts < ActiveRecord::Migration
  def change
    add_column :puts, :post_id, :integer
  end
end
