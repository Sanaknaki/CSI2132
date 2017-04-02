class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :program_name
      t.integer :required_number_of_credits

      t.timestamps
    end
  end
end
