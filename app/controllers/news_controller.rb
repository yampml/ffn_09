class NewsController < ApplicationController
  before_action :force_admin, only: %i(new create)

  def index
    @newss = News.newest.paginate page: params[:page], per_page: Settings.per_page
  end

  def show; end

  def new
      @news = current_user.news.build
  end

  def create
    @news = current_user.news.build news_params
    if @news.save
      flash[:success] = t "news.create.news_created_succ_mesg"
      redirect_to news_index_url
    else
      flash[:danger] = t "news.create.news_create_failed_msg"
      render :new
    end
  end

  private

  def force_admin
    redirect_to root_url unless current_user.admin?
  end

  def news_params
    params.require(:news).permit :header, :content
  end
end
