class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.binary :resume
	  has_many :comments, dependant => :destroy
      t.timestamps
    end
  end
end
