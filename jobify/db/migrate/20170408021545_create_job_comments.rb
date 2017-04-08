class CreateJobComments < ActiveRecord::Migration[5.0]
  def change
    create_table :job_comments do |t|
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
