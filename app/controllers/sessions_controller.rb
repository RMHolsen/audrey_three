class SessionsController < ApplicationController

    def new 
        @user = User.new 
        render :login 
        #Start a new user object, render the session view 'login'
    end 

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to @user 
        else 
            redirect_to 'login'
            #Redirecting is acceptable here for security protocol purposes
            #Flash error message goes here
        end 

    end 

    def destroy
        session.clear
        redirect_to root_path
    end 

    private 

end 