class NewsController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @per_page = 10
    @count = Article.count
    @articles = Article.paginate(:page => params[:trang], :per_page => @per_page).order("created_at desc")
  end

  def show
  end

  private

  def set_article
    @article = Article.find_by("lower(title) = ?", de_url(params[:id]))
  end
end
