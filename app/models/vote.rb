class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: :User
  belongs_to :review

  validates :voter, uniqueness: { scope: :review , message: "You have already shared your love/scrub of this review" }
  validates :love_scrub, presence: true

end
