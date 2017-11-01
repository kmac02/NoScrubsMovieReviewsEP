# USERS
has_many :comments, foreign_key: :commenter_id
has_many :reviews, foreign_key: :reviewer_id
has_many :ratings, foreign_key: :rater_id
has_many :votes, foreign_key: :voter_id

validates :username, uniqueness: true
validates :username, presence: true
validates :password, presence: true, length: { minimum: 6 }

*How do we utilize has_secure_password ?*

# COMMENTS
belongs_to :commenter, class_name: :User
belongs_to :review

validates :content, presence: true, { message: "A comment must have a message." }


# RATINGS
belongs_to :rater, class_name: :User
belongs_to :movie

validates :rater, uniqueness: { scope: :movie }, { message: "You have already rated this movie" }
validates :star_rating, presence: { message: "A ratings needs a proper value." }


# MOVIES
has_many :reviews
has_many :ratings
has_many :labelings

validates :title, :poster_url, presence: true


# REVIEWS
belongs_to :reviewer, class_name: :User
belongs_to :movie
has_many :comments, dependent: :destroy
has_many :votes, dependent: :destroy

validates :reviewer, uniqueness: { scope: :movie }, { message: "You have already reviewed this movie" }


# VOTES
belongs_to :voter, class_name: :User
belongs_to :review

validates :voter, uniqueness: { scope: :review }, { message: "You have already shared your love/scrub of this review" }
validates :love_srub, presence: true


# LABELINGS
belongs_to :movie
belongs_to :genre

# GENRES
has_many :movies
