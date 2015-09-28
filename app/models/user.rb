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
end


