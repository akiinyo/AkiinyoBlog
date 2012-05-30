class Profile < ActiveRecord::Base
  attr_accessible :blog_title, :message, :comment
  belongs_to :user
end
