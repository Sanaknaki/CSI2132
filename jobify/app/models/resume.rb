class Resume < ApplicationRecord
  belongs_to :student
  has_many :comment
end
