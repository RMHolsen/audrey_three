class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

    def new 
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)
        #Create a user with these params, only the username and password should be given in the form? 
        #Or maybe the email with the Omniauth
        #The rest, the user can edit those when logged in on their own page
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to @user
            #Change this to redirect to welcome_path which would be a static page with instructions
        else 
            render :new 
        end 
    end 

    def show 
    end 

    def edit 
    end 

    def update
        if @user.update(user_params) 
            redirect_to @user 
        else 
            render :edit 
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :profile, :display_name)
    end 

    def set_user 
        @user = User.find(params[:id])
    end 
end 