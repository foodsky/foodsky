class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to @comment.recipe

  end

  def destroy
    @comment = Comment.find(params[:id])
    recipe = @comment.recipe
    @comment.destroy

    redirect_to recipe
  end

  private
  def comment_params
    params.require(:comment).permit(:recipe_id, :content)
  end
end
