class ItemsController < ApplicationController

  def item_params
    params.require(:item).permit(:user_id, :title, :description, :price, :location, :condition, :status)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @item = Item.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @items = Item.all
    @items.each do |item|
      item.user_name = User.find item[:user_id]
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

  private
  
  def sort_column
    #Movies.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

end
