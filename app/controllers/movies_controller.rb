class MoviesController < ApplicationController
  def index
    # @movies = Movie.all
    @movies = Movie.order("created_at DESC").page params[:page]
    # add a popularity ordering method
  end

end

