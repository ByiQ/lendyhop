class CheckoutsController < ApplicationController

  def checkout_params
    params.require(:checkout).permit(:item_id, :user_id, :bintime)
  end
  
  def _days
    return [ 'm', 't', 'w', 'r', 'f', 's', 'u' ]
  end
  
  def _slots
    return [ 'm', 'a', 'e' ]
  end

  def new
    @item = Item.find(params[:id])
    reserves = Checkout.where(["item_id = ?", params[:id]])
    @days = _days
    @slots = _slots
    totalbintime = 0b0
    reserves.each do |reserve|
      totalbintime = totalbintime | reserve.bintime
    end
    puts totalbintime
    @taken = {}
    @days.reverse.each do |prefix|
      @slots.reverse.each do |suffix|
        @taken[prefix + suffix] = (totalbintime >> 1)[0]
        totalbintime >> 1
      end
    end
    puts @taken
  end

  def create
    pars = params
    days = _days
    slots = _slots
    bintime = 0b0
    days.each do |prefix|
      slots.each do |suffix|
        bintime = (bintime | (pars[prefix + suffix].to_i & 1)) << 1
      end
    end
    @par = checkout_params
    @par[:bintime] = bintime
    @checkout = Checkout.create!(@par)
    redirect_to item_path(@par[:item_id])
  end

end
