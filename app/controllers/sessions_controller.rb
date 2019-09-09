class SessionsController < ApplicationController
    
    def new
    end 

    def create
        user = User.find_by(email_address: params[:email_address])
        if user && user.authenticate(params[:password])
        session[:user_id]
        redirect_to breweries_path
        else 
            render :new
        end 
    end 

    def destroy 
        session.delete(:user_id)
        redirect_to login_path
    end 
end
