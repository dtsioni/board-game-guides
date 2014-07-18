class Guide < ActiveRecord::Base
	has_many Comments
	belongs_to User
	belongs_to Game
end
