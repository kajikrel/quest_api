class Api::ArticlesController < ApplicationController
  

  def show
     @article = Article.find_by!(slug: params[:slug])
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: { errors: @article.errors }, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find_by!(slug: params[:slug])
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
      @article = Article.find_by!(slug: params[:slug])
      @article.destroy
      render json: {}
  end




  private

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end

end
