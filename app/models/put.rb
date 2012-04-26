class Put < ActiveRecord::Base
  belongs_to :button
  belongs_to :post
end
