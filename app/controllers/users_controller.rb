class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:first_name, :last_name, :street, :city, :state, :postal_code, :age, :age, :email_address, :password_digest))
    @user.save
    redirect_to users_path(@user)
  end 

  def update
    @user = User.find(params[:id])
    @user.update(user_params(:first_name, :last_name, :street, :city, :state, :postal_code, :age, :age, :email_address, :password_digest))
    redirect_to users_path(@user)
  end 

  def destroy 
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_path
  end 

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end 
end
