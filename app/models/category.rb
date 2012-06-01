class Category < ActiveRecord::Base
  attr_accessible :kind
  belongs_to :post
end
