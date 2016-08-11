class ItemsController < ApplicationController

  def item_params
    params.require(:item).permit(:user_id, :title, :description, :price, :location, :condition, :status)
  end

  def show
    @comments = Comment.where(["item_id = ?", params[:id]])
    @tags = Tag.where(["item_id = ?", params[:id]])
    id = params[:id] # retrieve movie ID from URI route
    @item = Item.find(id) # look up movie by unique ID
    @item.user = User.find @item[:user_id]
    @checked_out = 0
    
    if (session[:user] != nil)
      reserves = Checkout.where("item_id = ? AND user_id = ?", params[:id], session[:user]["id"])
      reserves.each do |reserve|
        @checked_out += 1
      end
      puts @checked_out
    end
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @items = Item.all
    @items.each do |item|
      item.user = User.find item[:user_id]
    end
  end

  def new
    if (session[:user] == nil)
      flash[:notice] = "Please log in to submit an item"
      redirect_to items_path
    end
    #default: render 'new' template
  end

  def create
    @par = item_params
    @par[:user_id] = session[:user]['id']
    @item = Item.create!(@par)
    flash[:notice] = "#{@item.title} was successfully created."
    redirect_to items_path
  end

  def edit
    @item = Item.find params[:id]
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
    @terms = params[:terms]["terms"].split(" ")
    @results = { }
    search_tabs = [ [ Tag, "tag", :item_id ], [ Item, "title", :title ] ]
    search_tabs.each do |tab|
      @terms.each do |term|
        result = (tab[0]).where(tab[1] + " LIKE ?", "%" + term + "%")
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
    @terms = params[:terms]["terms"]
  end

  private
  
  def sort_column
    #Movies.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

end
