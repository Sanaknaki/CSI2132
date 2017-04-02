class AddResumeToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :resume, foreign_key: true
  end
end
