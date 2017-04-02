class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.string :resume_path
      t.integer :version
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
