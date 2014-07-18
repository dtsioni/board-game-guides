class Request < ActiveRecord::Base
	belongs_to Game
	belongs_to User
	has_many Comments
	
end
