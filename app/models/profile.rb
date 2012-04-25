class Profile < ActiveRecord::Base
  attr_accessible :blog_title, :message
  belongs_to :profile
end
