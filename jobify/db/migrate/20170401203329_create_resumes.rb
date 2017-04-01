class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
	  has_many :comments, dependant => :destroy
      t.string :resume_path
      t.integer :version
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
