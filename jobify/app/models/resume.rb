class Resume < ApplicationRecord
  belongs_to :student
  has_many :resume_comment
end
