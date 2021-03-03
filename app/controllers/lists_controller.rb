class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index 
        #Possibly a login method goes here so the person can only view all their lists, rather than all lists
        @lists = List.all 
    end 

    def show
        @items = @list.items 
    end 

    def new
        @list = List.new
    end 

    def create
        @list = List.new(list_params)
        #@list.project = Project.find_or_create_by(project_params)
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

    def destroy
        @list.destroy
        redirect_to lists_path 
    end 

    private

    def set_list
        @list = List.find(params[:id])
    end 

    def list_params
        params.require(:list).permit(:name)
    end 

    # def project_params
    #     params.require(:project).permit(:name)
    # end 
end 