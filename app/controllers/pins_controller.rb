class PinsController < ApplicationController

  def create
    @pin = Pin.new(pin_params)
    @pin.user = current_user
    @pin.save!
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  private
    def pin_params
      params.require(:pin).permit(:item_id, :influencer_id)
    end

end
