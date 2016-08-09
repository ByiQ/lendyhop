class CheckoutsController < ApplicationController

  def checkout_params
    params.require(:checkout).permit(:item_id, :user_id, :bintime)
  end

  def create
    pars = params
    bintime = 0b0
    bintime = (bintime | (pars['mm'].to_i & 1)) << 1
    bintime = (bintime | (pars['ma'].to_i & 1)) << 1
    bintime = (bintime | (pars['me'].to_i & 1)) << 1
    bintime = (bintime | (pars['tm'].to_i & 1)) << 1
    bintime = (bintime | (pars['ta'].to_i & 1)) << 1
    bintime = (bintime | (pars['te'].to_i & 1)) << 1
    bintime = (bintime | (pars['wm'].to_i & 1)) << 1
    bintime = (bintime | (pars['wa'].to_i & 1)) << 1
    bintime = (bintime | (pars['we'].to_i & 1)) << 1
    bintime = (bintime | (pars['rm'].to_i & 1)) << 1
    bintime = (bintime | (pars['ra'].to_i & 1)) << 1
    bintime = (bintime | (pars['re'].to_i & 1)) << 1
    bintime = (bintime | (pars['fm'].to_i & 1)) << 1
    bintime = (bintime | (pars['fa'].to_i & 1)) << 1
    bintime = (bintime | (pars['fe'].to_i & 1)) << 1
    bintime = (bintime | (pars['sm'].to_i & 1)) << 1
    bintime = (bintime | (pars['sa'].to_i & 1)) << 1
    bintime = (bintime | (pars['se'].to_i & 1)) << 1
    bintime = (bintime | (pars['um'].to_i & 1)) << 1
    bintime = (bintime | (pars['ua'].to_i & 1)) << 1
    bintime = (bintime | (pars['ue'].to_i & 1)) << 1
    puts bintime
  end

end
