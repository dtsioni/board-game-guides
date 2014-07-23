class RemoveVoteFlagFromVote < ActiveRecord::Migration
  def change
    remove_column :votes, :vote_flag, :boolean
  end
end
