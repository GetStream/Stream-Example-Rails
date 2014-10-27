class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :influencer

  validates :item, presence: true
  validates :user, presence: true

  include StreamRails::Activity
  as_activity
end
