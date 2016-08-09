class CheckoutsController < ApplicationController

  def checkout_params
    params.require(:checkout).permit(:item_id, :user_id, :bintime)
  end

  def create
    puts params
  end

end
