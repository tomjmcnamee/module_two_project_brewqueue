class UsersController < ApplicationController
  before_action :authorized?, :except => [:new, :create]

  def index
    @users = User.all
  end

  def show
    @comments = Comment.all 
    @user = User.find(params[:id])
    @user_brewqueues = UserBrewQueue.where(user_id: @user.id)
    @user_visits = @user.visits
    @states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    if params[:search_name] || params[:search_city] || params[:search_state]
      search_name = params[:search_name]
      search_city = params[:search_city] 
      search_state = params[:search_state] 
      @search_result_brewery_objs = Brewery.search_for_brewery(search_name.downcase, search_city.downcase,search_state)
      # redirect_to user_path(@user.id) - allready accomplished with the form_tag's first attribute
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.update(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash.now[:message] = @user.errors.full_messages
      render :new
    end
  end 

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.save
      redirect_to user_path(@user)
    else
      flash.now[:message] = @user.errors.full_messages
      render :edit
    end
  end 

  def destroy 
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_path
  end 

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :street, :city, :state, :postal_code, :age, :email_address, :password)
  end 

  def user_params_no_pw
    params.require(:user).permit(:first_name, :last_name, :street, :city, :state, :postal_code, :age, :email_address)
  end 
  
end
