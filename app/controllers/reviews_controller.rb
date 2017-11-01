class ReviewsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @genre = Genre.find(params[:genre_id])
    @review = @movie.reviews.create(params[:review].permit(:content))

    redirect_to genre_movie_path(@genre, @movie)
  end
end
