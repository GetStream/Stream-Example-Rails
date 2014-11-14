class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :influencer

  validates :item, presence: true, :uniqueness => {:scope => :user}
  validates :user, presence: true, :uniqueness => {:scope => :item}

  include StreamRails::Activity
  as_activity

  def activity_object
    self.item
  end

end
