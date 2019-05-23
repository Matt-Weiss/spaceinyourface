class User < ApplicationRecord
  validates_presence_of :email

  has_secure_password allow_blank: true
end
