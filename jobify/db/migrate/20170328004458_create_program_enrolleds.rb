class CreateProgramEnrolleds < ActiveRecord::Migration[5.0]
  def change
    create_table :program_enrolleds do |t|
      t.timestamps :start_date
      t.timestamps :graduation
      t.integer :level
      t.boolean :coop_required
      t.boolean :coop_offered
      t.integer :credits_required

      t.timestamps
    end
  end
end
