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
    @comment = @review.comments.new(comments_params)
    if @comment.save
      redirect_to review_comments_path(@review, @comment)
    else
      redirect_to review_comments_path(@review, @comment)
    end
  end

  private
  def comments_params
     params.require(:comment).permit(:content).merge(commenter_id: current_user.id)
  end
end
