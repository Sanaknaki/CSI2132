class Company < ApplicationRecord
  has_many :job
  has_many :comment
end
