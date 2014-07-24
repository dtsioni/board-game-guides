class Request < ActiveRecord::Base
	belongs_to :game
	belongs_to :user
	has_many :comments
  has_many :votes
  
	def count_votes(type)
    votes.where(vote_type: type).count
  end

  #compares "up" votes and "down" votes
  def score
    votes.where(vote_type: "up").count -
    votes.where(vote_type: "down").count
  end

  def voted_up?(user)
    if votes.where(user_id: user.id).where(vote_type:"up").where(request_id:id).count >= 1
      return true
    else
      return false
    end
  end

  def voted_down?(user)
    if votes.where(user_id: user.id).where(vote_type:"down").where(request_id:id).count >= 1
      return true
    else
      return false
    end
  end
end
