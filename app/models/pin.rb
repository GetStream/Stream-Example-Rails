class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :influencer
end
