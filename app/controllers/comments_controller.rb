class CommentsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :comment_of_correct_user, only: :destroy

  def create
    @article = News.find_by id: params[:article_id]
    return unless @article
    @comment = @article.comments.build comment_params
    @comment.user_id = current_user.id
    flash[:danger] = t(".comment_failed") unless @comment.save
    redirect_to @article
  end

  def destroy
    if @comment.destroy
      flash[:success] = t ".delete_success_msg"
    else
      flash[:danger] = t ".delete_failed_msg"
    end
    redirect_back_or root_url
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def comment_of_correct_user
    @comment = current_user.comments.find_by id: params[:id]
    return unless @comment.nil?
    flash[:danger] = t ".wrong_user"
    redirect_to root_url
  end
end
