class LikesController < ApplicationController
  include UsersHelper

  def create
    @article = Article.find(params[:article_id])
    @user = @article.user
    @like = Like.create user: @user, article: @article
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = @article.user.likes

    if @like
      @like.take.destroy
      redirect_to @article
    end
  end

  def show
    @article = Article.find(params[:article_id])
    @likes = @article.likes.all
  end
end
