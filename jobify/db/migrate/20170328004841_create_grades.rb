class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.string :prof
      t.string :letter
      t.decimal :numerical_grade

      t.timestamps
    end
  end
end
