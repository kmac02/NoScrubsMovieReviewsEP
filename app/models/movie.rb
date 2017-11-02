class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :ratings
  has_many :labelings
  has_many :genres, through: :labelings

  validates :title, :poster_url, presence: true
end
