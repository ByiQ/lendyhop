class CheckoutsController < ApplicationController

  def checkout_params
    params.require(:checkout).permit(:item_id, :user_id, :bintime)
  end

  def new
  end
  
  def submit
    @par = tag_params
    @tag = Tag.create!(@par)
    redirect_to item_path(@par[:item_id])
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    id = @tag[:item_id]
    @tag.destroy
    redirect_to item_path(id)
  end

end
