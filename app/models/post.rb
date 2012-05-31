class Post < ActiveRecord::Base
  attr_accessible :body, :title, :comment
  belongs_to :user
  has_many :comments
  has_many :buttons
  has_many :puts

  validates :body, presence: true
  validates :title, presence: true

  default_scope order: 'posts.created_at DESC'

  paginates_per 15

  def next
    user.posts.where('id < ?', id).order('created_at DESC').first
  end

  def previous
    user.posts.where('id > ?', id).order('created_at DESC').last
  end
end
