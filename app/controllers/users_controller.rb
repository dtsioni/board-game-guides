class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		@user.score = 0
		respond_to do |format|
			if @user.save
				sign_in @user
				flash[:success] = "Welcome!" 
				format.html {redirect_to @user, notice: 'User was successfully created.'}
			else
				format.html {render :new}
			end
		end
	end

	def edit
	end

	def show
	end

	def update
	end

	def destroy
	end	

	def index
	end

	private
	    def set_user
	      @user = User.find(params[:id])
	    end


	    def user_params
	      params.require(:user).permit(:name, :email, :role, :rank, :password, :password_confirmation)
	    end 
end
