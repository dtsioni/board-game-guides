class GuidesController < ApplicationController
  #before_action :set_game, only: [:create]
  def index
    @guides = Guide.all
  end

  def new    
    @guide = Guide.new
    @game = Game.find(params[:game_id])
  end



  def create
    @game = Game.find(params[:game_id])
    @guide = @game.guides.new(guide_params)    
    current_user.guides.new(guide_params)
    @guide.update_attribute(:user_id, current_user.id)

    respond_to do |format|
      if @guide.save
        flash[:success] = "Guide successfully created"
        format.html{redirect_to @guide}
      else
        flash[:error] = "There was an error. Guide not created."
        format.html {render :new}
      end
    end
  end

  def edit    
    @guide = Guide.find(params[:id])
  end

  def show
    @guide = Guide.find(params[:id])
  end

  def update
    respond_to do |format|
      if @guide.update(guide_params)
        flash[:success] = "Guide was successfully updated."
        format.html{redirect_to @guide}
      else
        flash[:error] = "Game was not successfully updated."
        format.html{render :edit}
      end
    end
  end

  def destroy
    @guide = Guide.find(params[:id])
    @guide.destroy
    respond_to do |format|
      flash[:success] = "Guide successfully destroyed."
      format.html{redirect_to root_path}
    end    
  end

  private
    def set_game
      @game = Game.find(params[:game_id])
    end

    def guide_params
      params.require(:guide).permit(:name, :format, :body, :game_id, :link)
    end 

end
