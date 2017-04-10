class Student < ApplicationRecord
  belongs_to :user
  has_many :resume
  has_many :company_rating
end
