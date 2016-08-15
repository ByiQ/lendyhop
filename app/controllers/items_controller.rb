class ItemsController < ApplicationController

  def nnull_params
    return [ :user_id, :title, :description, :price, :location, :condition, :status ]
  end
  
  def null_params
    return []
  end

  def item_params
    params.require(:item).permit(nnull_params.concat(null_params))
  end

  def show
    # get everything for the item
    @comments = Comment.where(["item_id = ?", params[:id]])
    @tags = Tag.where(["item_id = ?", params[:id]])
    id = params[:id] # retrieve movie ID from URI route
    @item = Item.find(id) # look up movie by unique ID
    @item.user = User.find @item[:user_id]
    @checked_out = 0
    
    # simple flag to see if the user has checked out the item
    if (session[:user] != nil)
      reserves = Checkout.where("item_id = ? AND user_id = ?", params[:id], session[:user]["id"])
      
      # error handling in case user managed to checkout more than one
      reserves.each do |reserve|
        @checked_out += 1
      end
    end
  end

  def index
    @items = Item.all
    @items.each do |item|
      item.user = User.find item[:user_id]
    end
  end

  def new
    # must be logged in to create
    if (session[:user] == nil)
      flash[:notice] = "Please log in to submit an item"
      redirect_to items_path
    end
  end

  def create
    @par = item_params
    @par[:user_id] = session[:user]['id']
    
    # make sure it's a valid entry
    if @par.has_value?('')
      flash[:notice] = (@par[:title].nil? ? "Unknown" : @par[:title]) + " item failed"
      redirect_to new_item_path
    else
      @item = Item.create!(@par)
      flash[:notice] = "#{@item.title} was successfully created."
      redirect_to items_path
    end
  end

  def edit
    @item = Item.find params[:id]
    
    # user must be logged in and the owner
    if (session[:user] == nil || session[:user]["id"] != @item[:user_id])
      flash[:notice] = "You must be logged in to the owning account of this item to edit it"
      redirect_to item_path(params[:id])
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes!(item_params)
    flash[:notice] = "#{@item.title} was successfully updated."
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item '#{@item.title}' deleted."
    redirect_to items_path
  end
  
  def search
    terms = params[:terms]["terms"].downcase.split(" ")
    @results = { }
    
    # serach against item tags and titles
    search_tabs = [ [ Tag, "tag", :item_id ], [ Item, "title", :id ] ]
    search_tabs.each do |tab|
      terms.each do |term|
        result = (tab[0]).where("LOWER ( " + tab[1] + " ) LIKE ?", "%" + term + "%")
        if (!result.nil?)
          result.each do |tag|
            if (@results[tag[tab[2]]].nil?)
              @results[tag[tab[2]]] = 1
            else
              @results[tag[tab[2]]] += 1
            end
          end
        end
      end
    end
    
    @results.sort_by{|k, v| v}.reverse
    @items = []
    
    @results.each do |id, count|
      @items.push(Item.find(id))
      @items[-1].attributes[:scount] = count
    end
    
    @pars = params[:terms]["terms"]
    @terms = Object.new

    # do some magic to make the terms remembered...don't know why I couldn't get a standard method to work
    eval("def @terms.terms
      return '" + @pars + "'
    end");
  end

end