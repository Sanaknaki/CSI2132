class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.text :job_description
      t.integer :level_direct_to
      t.integer :ranking

      t.timestamps
    end
  end
end
