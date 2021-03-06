class ArticlesController < ApplicationController
  before_action :set_article, only: [:update, :edit, :show, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:update, :edit, :destroy]
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
    @article = Article.paginate(page: params[:page], per_page: 3)
  end
  def create
    #debugger
    @article = Article.new(article_params)
    @article.user = current_user
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
  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end
  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end
end