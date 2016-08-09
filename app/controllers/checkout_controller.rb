class CheckoutsController < ApplicationController

  def checkout_params
    params.require(:checkout).permit(:item_id, :user_id, :bintime)
  end

  def new
    puts params
    # @item = Item.find(params[:item])
  end

  def create
    pars = params
    days = [ 'm', 't', 'w', 'r', 'f', 's', 'u' ]
    slots = [ 'm', 'a', 'e' ]
    bintime = 0b0
    days.each do |prefix|
      slots.each do |suffix|
        bintime = (bintime | (pars[prefix << suffix].to_i & 1)) << 1
      end
    end
    @par = checkout_params
    @par[:bintime] = bintime
    @checkout = Checkout.create!(@par)
    redirect_to item_path(@par[:item_id])
  end

end
