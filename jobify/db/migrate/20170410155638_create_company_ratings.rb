class CreateCompanyRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :company_ratings do |t|
      t.float :rating
      t.references :student, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
