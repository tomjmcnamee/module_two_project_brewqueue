class VisitsController < ApplicationController
    def index
        @visits = Visit.all
    end 
    
    def show
        @visit = Visit.find(params[:id])
    end 

    def edit
        @visit = Visit.find(params[:id])
    end 

    def new
        @visit = Visit.new
        @user_brew_queue = UserBrewQueue.all
    end 

    def create
        @visit = Visit.create(visit_params)
        redirect_to visit_path(@visit)
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