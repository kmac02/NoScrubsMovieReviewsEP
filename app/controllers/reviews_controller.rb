class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(params[:review].permit(:content))

    redirect_to movie_path(@movie)
  end
end
