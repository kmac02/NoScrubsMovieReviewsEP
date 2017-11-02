class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: :User
  belongs_to :review

  validates :content, presence: true, { message: "A comment must have a message." }

end
