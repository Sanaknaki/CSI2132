class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :course_code
      t.string :course_name
      t.text :course_description

      t.timestamps
    end
  end
end
