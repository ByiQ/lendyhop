class CheckoutsController < ApplicationController

  def checkout_params
    params.require(:checkout).permit(:item_id, :user_id, :bintime)
  end

  def create
    pars = params
    bintime = 0b0
    bintime = (bintime | pars['mm']) << 1
    bintime = (bintime | pars['ma']) << 1
    bintime = (bintime | pars['me']) << 1
    bintime = (bintime | pars['tm']) << 1
    bintime = (bintime | pars['ta']) << 1
    bintime = (bintime | pars['te']) << 1
    bintime = (bintime | pars['wm']) << 1
    bintime = (bintime | pars['wa']) << 1
    bintime = (bintime | pars['we']) << 1
    bintime = (bintime | pars['rm']) << 1
    bintime = (bintime | pars['ra']) << 1
    bintime = (bintime | pars['re']) << 1
    bintime = (bintime | pars['fm']) << 1
    bintime = (bintime | pars['fa']) << 1
    bintime = (bintime | pars['fe']) << 1
    bintime = (bintime | pars['sm']) << 1
    bintime = (bintime | pars['sa']) << 1
    bintime = (bintime | pars['se']) << 1
    bintime = (bintime | pars['um']) << 1
    bintime = (bintime | pars['ua']) << 1
    bintime = (bintime | pars['ue']) << 1
    puts bintime
  end

end
