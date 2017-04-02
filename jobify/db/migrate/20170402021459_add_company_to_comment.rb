class AddCompanyToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :company, foreign_key: true
  end
end
