class MoviesController < ApplicationController
  def index
    # @movies = Movie.all
    @movies = Movie.order("created_at DESC").page params[:page]
  end

end

