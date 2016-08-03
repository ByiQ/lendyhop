class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:firstname, :lastname, :user_name, :address, :phone)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @user = User.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @users = User.all
  end

  def new
    #default: render 'new' template
  end

  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.firstname} was successfully created."
    redirect_to users_path
  end

  def edit
    @user = User.find params[:id]
  end
  
  def login
    @user
    # @user = User.find params[:user_name]
    # session[:userID] = @user.id
  end
  
  def verify
    name = user_params[:user_name]
    @user = User.where(["user_name = ?", name]).first
    session[:user] = @user
    redirect_to items_path
    #redirect_to user_path(@user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.firstname} was successfully updated."
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.firstname}' deleted."
    redirect_to users_path
  end

  private
  
  def sort_column
    #Movies.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

end
