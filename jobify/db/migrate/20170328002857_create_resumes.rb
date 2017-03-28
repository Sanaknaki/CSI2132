class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.string :resume
      t.string :binary

      t.timestamps
    end
  end
end
