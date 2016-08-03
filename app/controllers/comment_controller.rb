class CommentsController < ApplicationController

  def comment_params
    params.require(:comment).permit(:item_id, :user_id, :comment)
  end

  def new
  end
  
  def submit
    @par = comment_params
    if (session[:user] == nil)
      flash[:notice] = "Please log in to submit an comment"
      redirect_to item_path(@par[:item_id])
    end
    @par[:user_id] = session[:user]['id']
    @comment = Comment.create!(@par)
    redirect_to item_path(@par[:item_id])
  end

end
