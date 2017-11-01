class Rating < ActiveRecord::Base
  belongs_to :rater, class_name: :User
  belongs_to :movie

  validates :rater, uniqueness: { scope: :movie }, { message: "You have already rated this movie" }
  validates :star_rating, presence: { message: "A ratings needs a proper value." }
end