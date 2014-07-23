class Guide < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	belongs_to :game
  has_many :votes
end
