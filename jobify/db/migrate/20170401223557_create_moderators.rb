class CreateModerators < ActiveRecord::Migration[5.0]
  def change
    create_table :moderators do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
