class AddIdsToModels < ActiveRecord::Migration
	def change
		
		#adding relational id's to all models

		#games
		add_column :games, :user_id, :integer
		#guides
		add_column :guides, :user_id, :integer
		add_column :guides, :game_id, :integer
		#resources
		add_column :resources, :game_id, :integer
		add_column :resources, :user_id, :integer
		#comments
		add_column :comments, :resource_id, :integer
		add_column :comments, :post_id, :integer
		add_column :comments, :guide_id, :integer
		add_column :comments, :user_id, :integer
		add_column :comments, :request_id, :integer
		#posts
		add_column :posts, :user_id, :integer
		#requests
		add_column :requests, :user_id, :integer
		add_column :requests, :game_id, :integer
	end	
end