class PageController < ApplicationController
  def home
  end

  def landing
    if user_signed_in?
      redirect_to home_path
    end

  end
end
