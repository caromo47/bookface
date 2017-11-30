class User < ActiveRecord::Base
  has_secure_password

	has_many :friendships, :foreign_key => "user_id", :class_name => "Friendship"
	has_many :friends, :through => :friendships

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :name, presence: true, length: { minimum: 2 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

	before_save :email_lowercase

	def email_lowercase
		email.downcase!
	end
end
