class FollowsController < ApplicationController

  def create
    follow = Follow.new(follow_params)
    follow.user = current_user
    if follow.save
      StreamRails.feed_manager.follow_user(follow.user_id, follow.target_id)
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def destroy
    follow = Follow.find(params[:id])
    if follow.user_id == current_user.id
      follow.destroy!
      StreamRails.feed_manager.unfollow_user(follow.user_id, follow.target_id)
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  private
    def follow_params
      params.require(:follow).permit(:target_id)
    end

end
