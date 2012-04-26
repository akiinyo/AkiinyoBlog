class Button < ActiveRecord::Base
  attr_accessible :kind
  belongs_to :user
  has_many :puts
end
