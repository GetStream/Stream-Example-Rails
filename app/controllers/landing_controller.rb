class LandingController < ApplicationController
  before_action :sign_in_admin, unless: :user_signed_in?

  def index
    @items = Item.all
  end

  def sign_in_admin
    sign_in (User.where(email: Rails.application.secrets.admin_email).first)
  end

end
