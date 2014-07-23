class Game < ActiveRecord::Base
	has_many :requests
	has_many :guides
	has_many :resources
	has_many :requests

  has_many :users, through: :requests

	belongs_to :user
	
end
