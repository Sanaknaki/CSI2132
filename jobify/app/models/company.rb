class Company < ApplicationRecord
  has_many :job
  has_many :comment
  has_many :company_rating
end
