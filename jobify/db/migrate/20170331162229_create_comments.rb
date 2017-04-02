class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
	  t.text :ctext
	  t.boolean :is_company
	  t.boolean :is_job
	  t.boolean :is_resume
      t.timestamps
    end
  end
end
