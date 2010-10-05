class UsersController < ApplicationController
  respond_to :html, :js

  def index
    respond_with(@users = User.all)
  end

  def new
    respond_with(@user = User.new)
  end
  
  def show
    respond_with(@user = User.find(params[:id]))
  end
  
  def create
    @user = User.new(params[:user])
    @user.save and flash[:notice] = "Yay! User has been created!"
    respond_with(@user, :location => users_url)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy and flash[:notice] = "User has been deleted!"
    respond_with(@user, :location => users_url)
  end
end
