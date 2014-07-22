class Resource < ActiveRecord::Base
	belongs_to :game
	belongs_to :user
	has_many :comments
end
