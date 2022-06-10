class FriendshipsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_user

  def create
    current_user.follow(@user)
    @article = Article.find(params[:article_id])
    redirect_to @article
  end
  
  def destroy 
    current_user.unfollow(@user)
    @article = Article.find(params[:article_id])
    redirect_to @article
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end
end
