class PageController < ApplicationController

  before_action :authenticate_user!, only: [:home]

  def home
    @recipes = current_user.recipes
  end

  def landing
    if user_signed_in?
      redirect_to home_path
    end

  end
end
