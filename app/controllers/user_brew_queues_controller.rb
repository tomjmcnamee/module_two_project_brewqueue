class UserBrewQueuesController < ApplicationController
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
    brewery_id = params[:breweryid_to_add]
    user_id = params[:userid_to_add]
    if new_user_brew_queue = UserBrewQueue.new(brewery_id: brewery_id, user_id: user_id)
        new_user_brew_queue.save
    else
      flash.now[:messages] = new_user_brew_queue.errors.full_messages
    end
    redirect_to user_path(params[:userid_to_add])
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
