class CheckoutsController < ApplicationController

  def checkout_params
    params.require(:checkout).permit(:item_id, :user_id, :bintime)
  end

  def new
  end
  
  def submit
    puts params
  end
  
  def destroy
  end

end
