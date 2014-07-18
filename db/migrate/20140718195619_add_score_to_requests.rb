class AddScoreToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :score, :integer
  end
end
