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
    # only users can check out
    if (session[:user] == nil)
      flash[:notice] = "You must be logged in to checkout this item"
      redirect_to item_path(params[:id])
    end
    
    @item = Item.find(params[:id])
    reserves = Checkout.where(["item_id = ?", params[:id]])
    @days = _days
    @slots = _slots
    
    # find the already selected times
    totalbintime = 0b0
    reserves.each do |reserve|
      totalbintime = totalbintime | reserve.bintime
    end
    
    totalbintime = totalbintime >> 1
    
    # parse the binary time into a hash of distinct time slots
    @taken = {}
    @days.reverse.each do |prefix|
      @slots.reverse.each do |suffix|
        @taken[prefix + suffix] = totalbintime % 2 #because &1 always was 0 >:|
        totalbintime = totalbintime >> 1
      end
    end
  end

  def create
    pars = params
    days = _days
    slots = _slots
    bintime = 0b0
    
    # create an integer representation of the selected times
    days.each do |prefix|
      slots.each do |suffix|
        bintime = (bintime | (pars[prefix + suffix].to_i & 1)) << 1
      end
    end
    
    @par = checkout_params
    
    # will always be >0 if at least one was selected
    if (bintime > 0)
      @par[:bintime] = bintime
      @checkout = Checkout.create!(@par)
      flash[:notice] = "Item successfully checked out"
    else
      flash[:notice] = "No valid checkout times entered"
    end
    redirect_to item_path(@par[:item_id])
  end
  
  def destroy
    @all_rel = Checkout.where(["item_id = ? AND user_id = ?", params[:id], session[:user]["id"]])
    @all_rel.each do |checkout|
      checkout.destroy
    end
    redirect_to item_path(params[:id])
  end

end
