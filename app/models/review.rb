class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: :User
  belongs_to :movie
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :reviewer, uniqueness: { scope: :movie , message: "You have already reviewed this movie" }
  validates_length_of :content, :minimum => 10
  def lovescrub_ratio
    if self.votes.empty?
      return 0
    end
    love = []
    total_votes = self.votes.count
    self.votes.pluck('love_scrub').each do |vote|
        if vote == true
      love << 1
        end
      end
    total_love = love.reduce(:+)
    (total_love/total_votes) * 100
  end

  #This method needs to go in an overall helper
  def sort_by_lovescrub_ratio(reviews)
    reviews.sort_by {|review| review.lovescrub_ratio}.reverse
  end
end
