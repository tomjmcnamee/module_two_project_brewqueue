class UserBrewQueuesController < ApplicationController
  before_action :authorized?

  def index
    @user_brew_queues = UserBrewQueue.all
  end

  def show
    @user_brew_queue = UserBrewQueue.find(params[:id])
  end

  def edit
    @user_brew_queue = UserBrewQueue.find(params[:id])
  end

  def new
    @user_brew_queue = UserBrewQueue.new
  end

  def create
    @user_brew_queue = UserBrewQueue.new(user_brew_queue_params(:brewery_id, :user_id, :interested_in, :favorite))
    @user_brew_queue.save
    redirect_to user_brew_queues_path(@user_brew_queue)
  end 

  def update
    @user_brew_queue = UserBrewQueue.find(params[:id])
    @user_brew_queue.update(user_brew_queue_params(:brewery_id, :user_id, :interested_in, :favorite))
    redirect_to user_brew_queues_path(@user_brew_queue)
  end 
  
  def destroy 
    @user_brew_queue = UserBrewQueue.find(params[:id])
    @user_brew_queue.delete
    redirect_to user_brew_queues_path
  end 

  private

  def user_brew_queue_params(*args)
    params.require(:user_brew_queue).permit(*args)
  end 
end
