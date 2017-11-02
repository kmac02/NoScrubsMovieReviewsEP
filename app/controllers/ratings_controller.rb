class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    p params["rating"["star_rating"]]

    @rating = @movie.ratings.new(movie_id: @movie.id, rater_id: current_user.id, star_rating: params[:star_rating])
    if @rating.save
      redirect_to movie_reviews_path(@movie)
    else
      redirect_to movie_reviews_path(@movie)
    end
  end

end
