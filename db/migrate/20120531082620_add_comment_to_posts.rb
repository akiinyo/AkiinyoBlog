class AddCommentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comment, :boolean, default: :true
  end
end
