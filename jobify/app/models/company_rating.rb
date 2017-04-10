class CompanyRating < ApplicationRecord
  belongs_to :student
  belongs_to :company
end
