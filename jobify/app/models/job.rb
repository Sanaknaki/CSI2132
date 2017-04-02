class Job < ApplicationRecord
  belongs_to :company
  has_many :comments, dependant => :destroy
end
