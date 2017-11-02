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
    @comment = @review.comments.create(comments_params)
    # change to save method for error handling
    redirect_to review_comment_path(@review, @comment)
  end
  
  private
  def comments_params
     params.require(:comment).permit(:content) 
  end
end
