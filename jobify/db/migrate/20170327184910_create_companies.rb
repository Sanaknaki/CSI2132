class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :sector
      t.string :rating
      t.string :website
      t.string :colour
	  has_many :companycomments
      t.timestamps
    end
  end
end
