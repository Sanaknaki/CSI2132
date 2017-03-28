class CreateInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :interviews do |t|
      t.timestamps :start_time
      t.timestamps :end_time
      t.string :address

      t.timestamps
    end
  end
end
