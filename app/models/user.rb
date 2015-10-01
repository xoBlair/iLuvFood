class User < ActiveRecord::Base
	has_many :recipes
	has_secure_password
	require 'bcrypt'

	attr_accessor :password

  validates :first_name, :presence => true,
                        :length => { :maximum => 25 }

  validates :last_name, :presence => true,
                        :length => { :maximum => 50 }

  VALID_EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :email, :presence => true,
                    :uniqueness => { case_sensitive: false}, 
                    :length => { :maximum => 100 },
                    :format => { with: VALID_EMAIL_REGEX },
                    :confirmation => true
    # check to see if a supplied user password matches the hashed version in the database
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end



  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  
  

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: lambda { |avatar| avatar.instance.set_default_url}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  def set_default_url
  ActionController::Base.helpers.asset_path('default-avatar.png')
end

end


