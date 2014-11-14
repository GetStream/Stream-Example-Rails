class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, class_name: "User"

  validates :target_id, presence: true
  validates :user, presence: true

  include StreamRails::Activity
  as_activity

  def activity_notify
    [StreamRails.feed_manager.get_notification_feed(self.target_id)]
  end

  def activity_object
    self.target
  end

end
