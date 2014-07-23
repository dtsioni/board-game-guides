class GamesController < ApplicationController

	before_action :set_game, only: [:show, :edit, :update, :destroy]

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)

		respond_to do |format|
			if @game.save
				flash[:success] = "New Game Created"
				format.html {redirect_to @game, notice: "Game was successfully created"}
			else
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
	end

	def show
	end

	def update
	end

	def destroy
	end
	private
		def set_game
			@game = Game.find(params[:id])
		end

		def game_params
			params.require(:game).permit(:name, :description)
		end


end
