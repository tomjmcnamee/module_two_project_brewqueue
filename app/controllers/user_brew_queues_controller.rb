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
    brewery_id = params[:breweryid_for_action]
    user_id = params[:userid_for_action]
    if new_user_brew_queue = UserBrewQueue.new(brewery_id: brewery_id, user_id: user_id)
        new_user_brew_queue.save
    else
      flash.now[:messages] = new_user_brew_queue.errors.full_messages
    end
    redirect_to user_path(user_id)
  end 

  def update
    @user_brew_queue = UserBrewQueue.find(params[:id])
    @user_brew_queue.update(user_brew_queue_params(:brewery_id, :user_id, :interested_in, :favorite))
    redirect_to user_brew_queues_path(@user_brew_queue)
  end 
  
  def destroy 
    brewery_id = params[:breweryid_for_action]
    user_id = params[:userid_for_action]
    
    if destroyed_bq = UserBrewQueue.find_by(brewery_id: brewery_id, user_id: user_id).destroy
    else
      flash.now[:messages] = new_user_brew_queue.errors.full_messages.first
    end
    redirect_to user_path(user_id)
  end 

  private

  def user_brew_queue_params(*args)
    params.require(:user_brew_queue).permit(*args)
  end 
end
