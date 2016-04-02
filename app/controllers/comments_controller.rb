class CommentsController < ApplicationController
  before_action :require_login

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    # respond_to do |format|
      if @comment.save
        redirect_to :back, notice:"blah"
        # format.html {redirect_to :back}
        # format.js {
        #   if @commentable = @listing
        #   render 'listingcomments.js.erb'
        # end}
      else
        render :new
      # end
    end
  end

  def destroy
    @comment = @commentable.comment.find(params[:id])
    @comment.destroy
  end

  def flag
    @flagged_comment = @commentable.comment.find(params[:id])
    if Flag.create(flagged: @flagged_comment, user: current_user)
      redirect_to :back, notice: "Flagged this listing"
    else
      redirect_to :back, notice: "Flagging didn't work"
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
