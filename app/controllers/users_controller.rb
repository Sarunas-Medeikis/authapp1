class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :destroy, :update]

  #Displaying all users
  def index
    @users = User.all
  end

  def show
  end

  #To render 'new' view.
  def new
    @user = User.new
  end

  #To create a new user, and if not succesfull render 'new'
  def create
    @user = User.new(user_params)
        if @user.save
          redirect_to root_url
      else
        render 'new'
      end
  end

  #Editing a user
  def edit
   @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      # if @user.save  won't update information in the db
      # if @user.update_attributes(user_params) will update information in db
    if @user.update_attributes(user_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    #@user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end

  private
   
  def set_user
    @user = User.find(params[:id])
    
  end
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
