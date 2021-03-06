class ArticlesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action 

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if current_user.id == @article.user_id
      if @article.update(article_params)
        redirect_to @article
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to @article
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if current_user.id == @article.user_id
      @article.destroy

      redirect_to root_path, status: :see_other
    else
      redirect_to @article
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, session[:user_id]) 
    end
end
