class PageController < ApplicationController
  def home
    if(user_signed_in?)
      @recipes= []
      @followings = current_user.following

      if @followings
        @followings.each do |following|
          following.recipes.each do |recipe|
            unless @recipes.include? recipe
              @recipes << recipe
            end
          end
        end
      end

      current_user.recipes.each do |recipe|
        @recipes << recipe
      end

      @recipes = @recipes.sort_by {|e| e[:create_at]}.reverse
    else
      redirect_to root_path
    end
  end

  def landing
    if user_signed_in?
      redirect_to home_path
    end

  end
end
