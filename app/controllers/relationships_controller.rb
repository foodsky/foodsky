class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def build
    load_following

    unless current_user == @following
      current_user.follow(@following)
      respond_to do |format|
        format.js
      end
    end
  end

  def over
    load_following

    if current_user.unfollow(@following)
      respond_to do |format| 
        format.js 
      end
    end
  end


  private

  def load_following
    @following = User.find(params[:following_id])
  end
end
