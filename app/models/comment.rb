class Comment < ActiveRecord::Base
  attr_accessible :body, :name
  belongs_to :post

  validates :body, presence: true
  validates :name, presence: true

  scope :recent_first, order("created_at DESC")
end
