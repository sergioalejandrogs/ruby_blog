class FriendshipsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_user

  def create
    if current_user != @user
      current_user.follow(@user)
      @article = Article.find(params[:article_id])
    end
    redirect_to @article
  end
  
  def destroy 
    if current_user != @user
      current_user.unfollow(@user)
      @article = Article.find(params[:article_id])
    end
    redirect_to @article
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end
end
