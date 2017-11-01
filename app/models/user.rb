class User < ActiveRecord::Base
  has_many :comments, foreign_key: :commenter_id
  has_many :reviews, foreign_key: :reviewer_id
  has_many :ratings, foreign_key: :rater_id
  has_many :votes, foreign_key: :voter_id

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end