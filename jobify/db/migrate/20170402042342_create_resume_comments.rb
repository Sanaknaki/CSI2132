class CreateResumeComments < ActiveRecord::Migration[5.0]
  def change
    create_table :resume_comments do |t|
      t.text :ctext
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
