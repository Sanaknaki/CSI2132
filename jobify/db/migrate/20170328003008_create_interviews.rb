class CreateInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :interviews do |t|
      t.string :start_time
      t.string :timestamps
      t.string :end_time
      t.string :timestamps
      t.string :address

      t.timestamps
    end
  end
end
