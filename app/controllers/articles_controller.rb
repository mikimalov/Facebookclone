class ArticlesController < ApplicationController
  include  UsersHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    unless user_present?
      flash[:danger] = 'Please sign in to continue.'
      redirect_to root_path and return
    end
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    unless user_present?
      flash[:danger] = 'Please sign in to continue.'
      redirect_to root_path and return
    end
    @article.user = user_with_same_id?
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    unless user_present?
      flash[:danger] = 'Please sign in to continue.'
      redirect_to root_path and return
    end
    @article = Article.find(params[:id])
    if @article.user == user_with_same_id?
      @article.destroy
      redirect_to articles_path
    else
      flash.now[:danger] = 'Wrong user!'
      redirect_to articles_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
