class Company < ApplicationRecord
  has_many :job
  has_many :comments, dependant => :destroy
end
