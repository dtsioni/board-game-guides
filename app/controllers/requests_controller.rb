class RequestsController < ApplicationController

	before_action :set_request, only: [:edit, :update, :destroy]
	before_action :set_game, only: [:edit, :update, :destroy]
	#authorize_resource

	def index
		@requests = Request.all		
	end

	def show
		@request = Request.find(params[:id])
		@game = Game.find(@request.game_id)
	end

	def new
		@request = Request.new			
		@request.answered = false
		@game = Game.select('id, name')
	end

	def edit
	end

	def create		
		@request = Request.new(request_params)
		current_user.requests.new(request_params)	
		@request.user_id = current_user.id
		@request.status = "Not being worked on"
		@request.score = 0		
		
		respond_to do |format|
			if @request.save				
				format.html{redirect_to @request, notice: 'Request was successfully created.'}
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
			format.html {redirect_to root_path, notice: "Request was succesfully removed."}
		end
	end

	private
		def set_request
			@request = Request.find(params[:id])
		end

		def set_game
			@game = @request.game 	
		end

		def request_params
			params.require(:request).permit(:title, :body, :game_id)
		end
end

