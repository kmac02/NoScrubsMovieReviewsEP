class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: :User
  belongs_to :review

  validates :content, presence: true
  validates_length_of :content, :minimum => 10
end
