class CommentsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

def index
  # @commentable = find_commentable
  # @comments = @commentable.comments
end

  def show
    @comment = Comment.find(params[:id])
  end


  def create

    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to :back
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  def flag
    @flagged_comment = Comment.find(params[:id])
    if Flag.create(flagged: @flagged_comment, user: current_user)
      redirect_to :back, notice: "Flagged this listing"
    else
      redirect_to :back, notice: "Flagging didn't work"
    end
  end
  
private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
