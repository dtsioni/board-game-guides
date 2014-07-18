class Post < ActiveRecord::Base
	has_many Comments
	belongs_to User
end
