class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]


  def index
    @recipes = current_user.recipes
  end

  def show
    @photos = @recipe.photos
    @recipe_comment = RecipeComment.new
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      if params[:images]
        params[:images].each do |image|
          @recipe.photos.create(file: image)
        end
      end

      @photos = @recipe.photos
      redirect_to edit_recipe_path(@recipe), notice: "Publish success!"
    else
      render :new
    end
  end

  def edit
    if current_user.id = @recipe.user_id
      @photos = @recipe.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  def update
    if @recipe.update(recipe_params)
      if params[:images]
        params[:images].each do |image|
          @recipe.photos.create(file: image)
        end
      end

      redirect_to edit_recipe_path(@recipe), notice: "Update success!"
    else
      render :edit
    end
  end


  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :describe, :ingredients, :serving, :method)
    end
end
