class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @review = Review.find(params[:review_id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.create(params[:comment].permit(:content))

    redirect_to review_comment_path(@review, @comment)
  end
end
