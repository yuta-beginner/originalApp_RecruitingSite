class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @selfPRarticles = current_user.articles.where(category: 'selfPR')
    @reasonarticles = current_user.articles.where(category: 'reason')
    @moviearticles = current_user.articles.where(category: 'movie')
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end

  # GET /articles/new
  def new
    @article = current_user.articles.new
  end

  # GET /articles/1/edit
  def edit
    @article = current_user.articles.find(params[:id])
  end

  # POST /articles
  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    @article = current_user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end
  
  # GET /articles/otherarticle
  def otherarticle
    @selfPRarticles = Article.where(category: 'selfPR')
    @reasonarticles = Article.where(category: 'reason')
    @moviearticles = Article.where(category: 'movie')
  end

  private
    def set_article
      @article = current_user.articles.find_by(params[:id])
      redirect_to(articles_url, alert: "ERROR!!") if @article.blank?
    end

    def article_params
      params.require(:article).permit(:category, :article_industry, :article_companyScale, :article_content, :user_id)
    end
end
