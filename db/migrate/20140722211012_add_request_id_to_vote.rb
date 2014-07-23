class AddRequestIdToVote < ActiveRecord::Migration
  def change
    add_column :votes, :request_id, :integer
  end
end
