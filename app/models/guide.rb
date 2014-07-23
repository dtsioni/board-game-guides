class Guide < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	belongs_to :game
  has_many :votes

  FORMATS = %w[text video]

  def score
    votes.where(vote_type: "up").count -
    votes.where(vote_type: "down").count
  end
  def count_votes(type)
    votes.where(vote_type: type).count
  end
end
