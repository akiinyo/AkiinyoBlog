class Profile < ActiveRecord::Base
  attr_accessible :blog_title, :message, :user_id
end
