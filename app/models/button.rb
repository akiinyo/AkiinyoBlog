class Button < ActiveRecord::Base
  attr_accessible :kind
  belongs_to :user
  belongs_to :post
  has_many :puts
end
