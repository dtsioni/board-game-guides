class AddAnsweredToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :answered, :boolean
  end
end
