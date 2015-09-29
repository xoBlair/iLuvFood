class User < ActiveRecord::Base
	has_many :recipes
	has_secure_password
	require 'bcrypt'

	attr_accessor :password

    # check to see if a supplied user password matches the hashed version in the database
    def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end


