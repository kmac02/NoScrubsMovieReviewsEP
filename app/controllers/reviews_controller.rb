class ReviewsController < ApplicationController

  def index
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
    @rating = Rating.new
  end

  def new
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_reviews_path(@movie)
    else
      redirect_to movie_reviews_path(@movie)
    end
  end

  private
  def review_params
     params.require(:review).permit(:content).merge(reviewer_id: current_user.id)
  end
end
