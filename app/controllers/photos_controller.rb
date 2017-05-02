class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    recipe = @photo.recipe

    @photo.destroy
    @photos = Photo.where(recipe_id: recipe.id)

    respond_to :js
  end
end
