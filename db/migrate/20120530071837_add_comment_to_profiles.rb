class AddCommentToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :comment, :boolean, default: true
  end
end
