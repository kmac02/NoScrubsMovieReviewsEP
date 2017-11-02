class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = @genre.movies.order("created_at DESC").page params[:page]
  end
end
