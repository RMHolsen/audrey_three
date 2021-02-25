class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update]

    def index 
        #Possibly a login method goes here so the person can only view all their lists, rather than all lists
        @lists = List.all 
    end 

    def show
    end 

    def new
        @list = List.new
    end 

    def create
        @list = List.new(list_params)
        if @list.valid?
            @list.save
            redirect_to @list 
        else 
            render :new
        end 
    end 

    def edit
    end 

    def update
        if @list.update(list_params)
            redirect_to @list 
        else 
            render :edit 
        end 
    end 

    # def destroy
    # end 

    private

    def set_list
        @list = List.find(params[:id])
    end 

    def list_params
        params.require(:list).permit(:name)
    end 
end 