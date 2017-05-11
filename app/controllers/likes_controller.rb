class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    load_recipe

    respond_to do |format|
      if current_user.add_like?(params[:recipe_id])
        format.js
      else
        format.json { render json: {status: :failed} }
      end
    end

  end

  def destroy
    load_recipe

    respond_to do |format|
      if current_user.delete_like?(params[:recipe_id])
        format.js
      else
        format.json { render json: {status: :failed} }
      end
    end
  end

  private

  def load_recipe
    @recipe = Recipe.find_by_id(params[:recipe_id])
  end
end
