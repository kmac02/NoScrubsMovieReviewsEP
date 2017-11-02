class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :reviewer
  has_many :ratings
  has_many :labelings
  has_many :genres, through: :labelings

  validates :title, :poster_url, presence: true

  def total_rating
    if self.ratings.empty?
      return 0
    end
  total_ratings = self.ratings.count
  star_total = self.ratings.pluck('star_rating').reduce(:+)
  star_total/total_ratings
  end

   paginates_per 12

end

