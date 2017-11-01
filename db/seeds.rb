# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# top 20 popular movies
Tmdb::Api.key(ENV["IMDB_API_KEY"])

@popular_movies = Tmdb::Movie.popular

@genres = Tmdb::Genre.list

@genres["genres"].each do |genre|
  Genre.create!(name: genre["name"])
end

@popular_movies.each do |movie|
  poster_url = "https://image.tmdb.org/t/p/w500" + movie.poster_path
  movie_detail = Tmdb::Movie.detail(movie.id)

  tagline = movie_detail["tagline"]
  movie_genres = movie_detail["genres"]
  made_movie = Movie.create!(title: movie.title, poster_url: poster_url, tag_line: tagline)
  movie_genres.each do |genre|
    found_genre = Genre.find_by(name: genre["name"])
    Labeling.create!(movie_id: made_movie.id, genre_id: found_genre.id)
  end
end

