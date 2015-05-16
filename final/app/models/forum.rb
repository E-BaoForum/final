class Forum < ActiveRecord::Base
	# validates :forum_name
	validates :forum_name, :uniqueness => true, :allow_nil => false, :presence => true
	
	belongs_to :user
	has_many :posts
end
