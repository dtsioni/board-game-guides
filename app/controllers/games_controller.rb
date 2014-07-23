class GamesController < ApplicationController

	before_action :set_game, only: [:show, :edit, :update, :destroy]

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)

		respond_to do |format|
			if @game.save
				flash[:success] = "Game was successfully created."
				format.html {redirect_to @game}
			else
				flash[:error] = "There was an error. Game not created."
				format.html {render :new}
			end
		end
	end

	def requests
		@game = Game.find(params[:id])
		@requests = @game.requests
		@requests.sort_by{|a| a.score}
	end	

	def edit
		@game = Game.find(params[:id])
	end

	def show
	end

	def update
		respond_to do |format|
			if @game.update(game_params)
				flash[:success] = "Game successfully updated."
				format.html{redirect_to @game}
			else
				flash[:error] = "Game not successfully updated."
				format.html{render :edit}
			end
		end
	end

	def destroy
		@game.guides.destroy
		@game.resources.destroy
		@game.requests.destroy

		@game.destroy
		respond_to do |format|
			flash[:success] = "Game successfully destroyed."
			format.html {redirect_to root_path}
		end		
	end
	
	private
		def set_game
			@game = Game.find(params[:id])
		end

		def game_params
			params.require(:game).permit(:name, :description)
		end


end
