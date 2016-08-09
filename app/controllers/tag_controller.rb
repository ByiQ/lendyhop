class CommentsController < ApplicationController

  def tag_params
    params.require(:item).permit(:item_id, :tag)
  end

  def new
  end
  
  def submit
    @par = tag_params
    @tag = Tag.create!(@par)
    redirect_to item_path(@par[:item_id])
  end

end
