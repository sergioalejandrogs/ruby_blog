class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if current_user.id == @comment.user_id  
      @comment.destroy
      redirect_to article_path(@article), status: 303
    else
      redirect_to article_path(@article)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status, :article_id, :user_id)
    end
end
