class Job < ApplicationRecord
  belongs_to :company
  has_many :job_comment
end
