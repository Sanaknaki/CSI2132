class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :job_description
      t.string :text
      t.string :level_direct_to
      t.string :integer
      t.string :ranking
      t.string :integer

      t.timestamps
    end
  end
end
