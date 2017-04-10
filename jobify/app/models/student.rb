class Student < ApplicationRecord
  belongs_to :user
  has_many :resume
  has_many :company_rating
  has_many :compnay_comment_upvote
end
