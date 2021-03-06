class NewsController < ApplicationController
  before_action :load_latest_news, only: :show

  def index
    @articles = News.newest.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
    @article = News.find_by id: params[:id]
    if @article.nil?
      flash[:danger] = t ".news_not_found"
      redirect_to root_path
    else
      @comments = @article.comments.newest
      store_location
    end
  end

  def new
    if current_user.admin?
      @article = current_user.news.build
    else
      redirect_to root_path
    end
  end

  def create
    @article = current_user.news.build news_params
    if @article.save
      flash[:success] = I18n.t "news.create.news_created_succ_mesg"
      redirect_to news_index_url
    else
      flash[:danger] = I18n.t "news.create.news_create_failed_msg"
      redirect_to request.referer
    end
  end

  private
  def load_latest_news
    @top10_news = News.newest.limit Settings.more_article_num
  end

  def news_params
    params.require(:news).permit :header, :content, :header_img, :main_content
  end
end
