class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)
    # change to save for error handling
    redirect_to movie_path(@movie)
  end
  
  private
  def review_params
     params.require(:review).permit(:content)
  end
end
