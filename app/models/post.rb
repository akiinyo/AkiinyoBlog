class Post < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :user

  validates :body, presence: true
  validates :title, presence: true

  default_scope order: 'posts.created_at DESC'
end
