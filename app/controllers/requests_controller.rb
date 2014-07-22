class RequestsController < ApplicationController

	before_action :set_request, only: [:edit, :update, :destroy]
	before_action :set_game, only: [:edit, :update, :destroy]
	#authorize_resource


	def index
		@requests = Request.all
		@game = Game.find(params[:game_id])
	end

	def show
		@request = Request.find(params[:id])
	end

	def new
		@request = Request.new	
		@game = Game.find(params[:game_id])	
	end

	def edit
	end



	def create
		@game = Game.find(params[:game_id])
		@request = @game.requests.new(request_params)		
		#@request.update_attribute(:game_id, @game.id)
		#@game.requests.new(request_params)
		
		respond_to do |format|
			if @request.save				
				format.html{redirect_to game_request_path(@game, @request), notice: 'Request was successfully created.'}
			else
				flash[:error] = "Request not created."
				format.html{render :new}
			end
		end		
	end

	def update
		respond_to do |format|
			if @request.update(request_params)
				format.html {redirect_to game_request_path(@game, @request), notice: "Request was successfully updated."}
			else
				format.html{render :edit}
			end
		end
	end

	

	

	def destroy
		@request.destroy
		respond_to do |format|
			format.html {redirect_to home_path, notice: "Request was succesfully removed."}
		end
	end


	private
		def set_request
			@game = Game.find(params[:game_id])			
			@request = @game.requests.find(params[:id])
		end

		def set_game
			@game = Game.find(params[:game_id])
		end

		def request_params
			params.require(:request).permit(:title, :body)
		end
end

