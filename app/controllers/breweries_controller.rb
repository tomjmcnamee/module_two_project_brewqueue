class BreweriesController < ApplicationController
  before_action :authorized?
  
  def index
    @breweries = Brewery.all
    @user = current_user
  end
  
  def show
    @brewery = Brewery.find(params[:id])
    @user = User.find(session[:user_id])
    #the next 5 are to gather all comments for a sinbgle brewery
      @brewery_bq_obj_arr = UserBrewQueue.where(brewery_id: @brewery.id)
      @bq_ids_arr = @brewery_bq_obj_arr.map { |bq| bq.id }
      @visit_obj_arr = Visit.where(user_brew_queue_id: @bq_ids_arr)
      @visit_id_arr = @visit_obj_arr.map {|vo| vo.id}
      @brewery_comments_obj_arr = Comment.where(visit_id: @visit_id_arr)
    # previouis 5 were to gather all comments for single brewery
    @brewqueue_id = ""
    if @user.user_brew_queues.find_by(brewery_id: @brewery.id) != nil
      @brewqueue_id = @user.user_brew_queues.find_by(brewery_id: @brewery.id).id
    end
    @bq_visit_objs = Visit.where(user_brew_queue_id: @brewqueue_id)
  end
  
  def edit
    @brewery = Brewery.find(params[:id])
  end
  
  def update
    @brewery = Brewery.find(params[:id])
    if @brewery.update(brewery_params)
      redirect_to brewery_path(@brewery.id)
    else
      flash.now[:messages] = @brewery.errors.full_messages.first
      render :edit
    end
  end
  
  def new
    @brewery = Brewery.new
  end
  
  def create
    @brewery = Brewery.new
    if @brewery.update(brewery_params)
      redirect_to breweries_path
    else
      render :new
    end
  end
  
  def destroy
    @brewery = Brewery.find(params[:id])
    @brewery.destroy
    redirect_to breweries_path
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :brewery_type, :street, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url)
  end

end
