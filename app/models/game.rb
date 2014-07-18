class Game < ActiveRecord::Base
	has_many Requests
	has_many Guides
	has_many Resources
	has_many Requests
	belongs_to User
	
end
