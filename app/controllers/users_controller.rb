class UsersController < ApplicationController

  def user_params
    params.require(:user_name, :firstname, :lastname, :address, :phone, :created_time).permit(:updated_time)
  end

  def user
    user_name = params[:user_name] # retrieve movie ID from URI route
    @user = User.find(user_name) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # do something
  end

  def new
    # default: render 'new' template
  end

  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.user_name} was successfully created."
    redirect_to items_path
  end

  def edit
    @user = User.find params[:user_name]
  end

  def update
    @user = User.find params[:user_name]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.user_name} was successfully updated."
    redirect_to items_path(@user)
  end

  def destroy
    #begin
    #@movie = Movie.find(params[:id])
    #@movie.destroy
    #flash[:notice] = "Movie '#{@movie.title}' deleted."
    #redirect_to movies_path
    #end
  end

  private
  
  def sort_column
    #Movies.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

end
