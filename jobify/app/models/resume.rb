class Resume < ApplicationRecord
  belongs_to :student
  has_many :comments, dependant => :destroy
end
