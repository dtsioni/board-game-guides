class VotesController < ApplicationController
  def new   
    @vote = Vote.new
    @requests = Request.select('id, title').to_a

  end

  def create
    @requests = Request.select('id, title').to_a
    @vote = current_user.votes.new(vote_params)
    respond_to do |format|
      if @vote.save
        flash[:success] = "Vote successful"
        format.html{redirect_to @vote.request, notice: "Vote was successful."}
      else
        flash[:error] = "Vote not successful"
        format.html {render :new}
      end
    end
  end

  private
    def vote_params
      params.require(:vote).permit(:vote_type, :request_id)
    end

end
