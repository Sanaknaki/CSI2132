class Resume < ApplicationRecord
  has_attached_file :pdf
  validates_attachment_content_type :pdf, content_type: { content_type: "application/pdf"  }
end
