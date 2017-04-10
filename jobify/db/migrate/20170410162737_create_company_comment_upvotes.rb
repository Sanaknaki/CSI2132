class CreateCompanyCommentUpvotes < ActiveRecord::Migration[5.0]
  def change
    create_table :company_comment_upvotes do |t|
      t.references :student, foreign_key: true
      t.references :comment, foreign_key: true
      t.timestamps
    end
  end
end
