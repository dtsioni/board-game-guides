class Comment < ActiveRecord::Base
	belongs_to Resource
	belongs_to Post
	belongs_to Guide
	belongs_to User
	belongs_to Request
end
