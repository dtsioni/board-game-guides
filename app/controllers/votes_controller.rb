class VotesController < ApplicationController
  def new   
    @vote = Vote.new
    @requests = Request.select('id, title').to_a

  end

  def create
    #give list of requests to vote on
    @requests = Request.select('id, title').to_a
    #make a new vote for the user based on params given
    @vote = current_user.votes.new(vote_params)
    #if upvote, remove previous downvotes
    if @vote.vote_type == "up"
      #go through all votes
      current_user.votes.each do |vote|
        #if the vote is not the same vote
        #and if the vote is a downvote
        #and if the vote is voting on the same request or guide
        if @vote.id != vote.id && vote.vote_type == "down" && @vote.request_id == vote.request_id
          #destroy vote
          vote.destroy
        end
      end
    end
    #if downvote, remove previous upvotes
    if @vote.vote_type == "down"
      #go through all votes
      current_user.votes.each do |vote|
        #if the vote is not the same vote
        #and if the vote is a downvote
        #and if the vote is voting on the same request or guide
        if @vote.id != vote.id && vote.vote_type == "up" && @vote.request_id == vote.request_id
          #destroy vote
          vote.destroy
        end
      end
    end
    #save
    respond_to do |format|
      if @vote.save
        flash[:success] = "Vote successful"
        format.html{redirect_to @vote.request, notice: "Vote was successful."}
        format.js{}
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
