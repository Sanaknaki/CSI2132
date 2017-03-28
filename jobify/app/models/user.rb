class User < ApplicationRecord
  has_secure_password
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates_uniqueness_of :email
end
