class User < ActiveRecord::Base
	has_many Requests
	has_many Guides
	has_many Comments
	has_many Posts
	
end
