class VisitsController < ApplicationController
    before_action :authorized?

    def index
        @visits = Visit.all
    end 
    
    def show
        @visit = Visit.find(params[:id])
        @new_comment = Comment.new
        @user = User.find(session[:user_id])
        @brewery_obj = @visit.user_brew_queue.brewery
        @visit_comments = Comment.where(visit_id: @visit.id)
    end 

    def edit
        @visit = Visit.find(params[:id])
    end 

    def new
        @visit = Visit.new
        @user_brew_queue = params[:brew_queue_id_for_action]
    end 

    def create
        @visit = Visit.new
            @user_brew_queue = params[:visit][:user_brew_queue_id]   
            if @visit.update(visit_params)
                @visit.save
                redirect_to brewery_path(@visit.user_brew_queue.brewery.id)
            else
                flash.now[:message] = @visit.errors.full_messages.first
                render :new
            end
        
``    end
    
    def update
        @visit = Visit.find(params[:id])
        @visit.update(visit_params)
        redirect_to visits_path(@visit)
    end 

    def destroy 
        @user = session[:user_id]
        @visit = Visit.find(params[:id])
        @comments_arr = Comment.where(visit_id: @visit)
        @comments_arr.each { |com| com.delete }
        @visit.delete
        redirect_to user_path(@user)
    end 

    private

    def visit_params
      params.require(:visit).permit(:user_brew_queue_id, :visit_date, :event_name)
    end 

end 