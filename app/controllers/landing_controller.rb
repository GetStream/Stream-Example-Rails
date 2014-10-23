class LandingController < ApplicationController

  def index
    @items = Item.all
  end

end
