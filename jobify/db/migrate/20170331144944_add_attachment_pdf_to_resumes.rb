class AddAttachmentPdfToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :pdf
      t.references :student, index: true, foreign_key: true
    end
  end

  def self.down
    remove_attachment :resumes, :pdf
  end
end
