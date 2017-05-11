class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def build
    load_following

    unless current_user == @following
      current_user.follow(@following)
      redirect_to user_path(@following)
    end
  end

  def over
    load_following

    if current_user.unfollow(@following)
     redirect_to user_path(@following)
    end
  end


  private

  def load_following
    @following = User.find(params[:following_id])
  end
end
