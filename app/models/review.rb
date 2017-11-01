class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: :User
  belongs_to :movie
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :reviewer, uniqueness: { scope: :movie }, { message: "You have already reviewed this movie" }
end