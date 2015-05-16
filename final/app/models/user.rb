class User < ActiveRecord::Base

	# validates :user_name, :presence => true
	validates :user_name, :uniqueness => true, :allow_nil => false
	validates :password, :presence => true

	has_many :forums
	has_many :posts
	has_many :forums
end
