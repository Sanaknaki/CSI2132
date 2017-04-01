class AddAttachmentPdfToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :resumes, :pdf
  end
end
