class Item < ActiveRecord::Base
  has_many :pins
  belongs_to :user

  def user_pin(user = nil)
    self.pins.where(user: user).first
  end

end
