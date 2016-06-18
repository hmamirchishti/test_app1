class ArticlesController < ApplicationController
  before_action :set_article, only: [:update, :edit, :show, :destroy]
  def new
    @article = Article.new
  end
  def edit
  end
  def update
    if @article.update(article_params)
        flash[:success] = "Article is successfully updated"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  def index
    @article = Article.all
  end
  def create
    #debugger
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article is successfully Created."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  def show
  end
  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
end