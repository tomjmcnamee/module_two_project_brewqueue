class VisitsController < ApplicationController
    def index
        @visits = Visit.all
    end 
    
    def show
        @visit = Visit.find(params[:id])
        @user = User.find(session[:user_id])
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
        @visit.update(visit_params)
        @visit.save
        redirect_to brewery_path(@visit.user_brew_queue.brewery.id)
    end
    
    def update
        @visit = Visit.find(params[:id])
        @visit.update(visit_params)
        redirect_to visits_path(@visit)
    end 

    def destroy 
        @visit = Visit.find(params[:id])
        @visit.delete
        redirect_to user_path(user)
    end 

    private

    def visit_params
      params.require(:visit).permit(:user_brew_queue_id, :visit_date, :event_name)
    end 

end 