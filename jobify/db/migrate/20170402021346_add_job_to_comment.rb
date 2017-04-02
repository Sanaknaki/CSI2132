class AddJobToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :job, foreign_key: true
  end
end
