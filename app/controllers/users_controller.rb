class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:firstname, :lastname, :user_name, :address, :phone)
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def index
    @users = User.all
  end

  def create
    @par = user_params
    
    # create user if everything is filled out
    if @par.has_value?('')
      flash[:notice] = "User " + (@par[:user_name].nil? ? "Unknown" : @par[:user_name]) + " failed"
      redirect_to new_user_path
    else
      @user = User.create!(user_params)
      session[:user] = @user
      flash[:notice] = "#{@user.firstname} was successfully created."
      redirect_to items_path
    end
  end

  def edit
    @user = User.find params[:id]
  end
  
  def login
    @user
    # @user = User.find params[:user_name]
    # session[:userID] = @user.id
  end
  
  def logout
    session[:user] = nil
    redirect_to items_path
  end
  
  def verify
    # login is a two-step process, with this being step 2
    name = user_params[:user_name]
    @user = User.where(["user_name = ?", name]).first
    
    # if a valid username, login
    if (!@user.nil?)
      session[:user] = @user
      session[:username] = @user.user_name;
      redirect_to items_path
    else
      flash[:notice] = "Username " + name + " not recognized"
      redirect_to login_user_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.firstname} was successfully updated."
    redirect_to items_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.firstname}' deleted."
    redirect_to items_path
  end

end
