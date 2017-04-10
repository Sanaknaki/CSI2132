class Comment < ApplicationRecord
  belongs_to :company
  has_many :company_comment_upvote
end
