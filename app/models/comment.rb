class Comment < ActiveRecord::Base
  attr_accessible :body, :name, :post_id
end
