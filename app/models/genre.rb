class Genre < ActiveRecord::Base
  has_many :labelings
  has_many :movies, through: :labelings
end
