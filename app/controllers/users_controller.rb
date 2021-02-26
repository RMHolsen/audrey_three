class UsersController < ApplicationController
    def new 
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)
        #Create a user with these params, only the username and password should be given in the form? 
        #Or maybe the email with the Omniauth
        #The rest, the user can edit those when logged in on their own page
        if @user.valid?
            @user.save 
            session[:user_id] = @user.id 
            redirect_to @user 
        else 
            render :new 
        end 
    end 

    def show 
        @user = User.find(params[:id])
    end 

    private

    def user_params
        params.require(:user).permit(:username, :password, :profile)
    end 
end 