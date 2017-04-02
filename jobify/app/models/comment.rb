class Comment < ApplicationRecord
  belongs_to :job
  belongs_to :resume
  belongs_to :company
end
