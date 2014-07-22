class User < ActiveRecord::Base
	has_many :requests
	has_many :guides
	has_many :comments
	has_many :posts

	ROLES = %w[admin moderator author banned]

	before_create :create_remember_token
	 #valid information
	 validates_uniqueness_of :name
	 before_save { self.email = email.downcase }
	 validates :name, presence: true, length: { maximum: 50 }
	 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	 validates :email, presence:   true,
	                   format:     { with: VALID_EMAIL_REGEX },
	                   uniqueness: { case_sensitive: false }
	 has_secure_password
	 validates :password, length: { minimum: 6 }, if: ->{password.present?}
	 #handling session token



	 def User.new_remember_token
	   SecureRandom.urlsafe_base64
	 end
	 def User.digest(token)
	   Digest::SHA1.hexdigest(token.to_s)
	 end
	 private
	   def create_remember_token
	     self.remember_token = User.digest(User.new_remember_token)
	   end	
end
