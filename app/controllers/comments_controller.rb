class CommentsController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to request.referer
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
