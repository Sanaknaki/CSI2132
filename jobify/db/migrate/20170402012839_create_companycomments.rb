class CreateCompanycomments < ActiveRecord::Migration[5.0]
  def change
    create_table :companycomments do |t|
	  belongs_to :company
      t.timestamps
    end
  end
end
