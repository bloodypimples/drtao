class NewsController < ApplicationController
  def index
    @per_page = 10
    @count = Article.count
    @articles = Article.paginate(:page => params[:trang], :per_page => @per_page).order("created_at desc")
  end

  def show
  end
end
