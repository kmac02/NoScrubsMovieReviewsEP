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

10.times do
  User.create(username: Faker::Internet.user_name, password: "password")
end

Review.create(content: "'Wonder Woman' is a superhero movie, and it fulfills the heroic and mythic demands of that genre, but it's also an entry in the genre of wisdom literature that shares hard-won insights and long-pondered paradoxes of the past with a sincere intimacy.", reviewer_id: 1, movie_id: 16)

Review.create(content: "Wonder Woman embraces issues of female power and the need to turn from hate to love, war to peace in a mainstream delivery system. And the female lead is not solely a mother, sister, girlfriend or hooker, however gold her heart: wonder of wonders!", reviewer_id: 2, movie_id: 16)

Review.create(content: "This is undoubtedly the strongest DCEU outing till now, one that will add a new world of (female) fans to the franchise, and for all the right reasons.", reviewer_id: 3, movie_id: 16)

Rating.create(star_rating: 3, rater_id: 1, movie_id: 16)
Rating.create(star_rating: 3, rater_id: 2, movie_id: 16)
Rating.create(star_rating: 2, rater_id: 3, movie_id: 16)
Rating.create(star_rating: 2, rater_id: 4, movie_id: 16)
Rating.create(star_rating: 2, rater_id: 5, movie_id: 16)
Rating.create(star_rating: 2, rater_id: 6, movie_id: 16)
Rating.create(star_rating: 1, rater_id: 7, movie_id: 16)

Comment.create(content: "I totally agree with you!", commenter_id: 7, review_id: 1)
Comment.create(content: "That's a great review you left! I will have to see it.", commenter_id: 9, review_id: 1)
