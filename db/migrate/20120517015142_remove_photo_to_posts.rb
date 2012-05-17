class RemovePhotoToPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :photo
  end

  def down
    add_column :posts, :photo, :string
  end
end
