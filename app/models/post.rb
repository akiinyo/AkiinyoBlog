class Post < ActiveRecord::Base
  attr_accessible :body, :title, :comment, :category_id
  belongs_to :user
  has_many :comments
  has_many :buttons
  has_many :puts
  has_one :category

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

  def category
    Category.where(id: category_id).first.kind
  end
end
