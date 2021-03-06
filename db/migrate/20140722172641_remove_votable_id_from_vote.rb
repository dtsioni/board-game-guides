class RemoveVotableIdFromVote < ActiveRecord::Migration
  def change
    remove_column :votes, :votable_id, :integer
    remove_column :votes, :votable_type, :string
    remove_column :votes, :voter_id, :integer
    remove_column :votes, :voter_type, :string
    remove_column :votes, :voter_flag, :boolean
    remove_column :votes, :vote_scope, :string
    remove_column :votes, :vote_weight, :integer
    remove_column :votes, :vote_flag, :boolean

  end
end
