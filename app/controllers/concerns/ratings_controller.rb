class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @rating = @movie.ratings.new(rating_params)
    if @rating.save
      redirect_to movie_reviews_path(@movie)
    else
      redirect_to movie_reviews_path(@movie)
    end
  end

  private
  def rating_params
    params.require(rating).permit(:star_rating).merge(rater_id: current_user.id)
  end

end
