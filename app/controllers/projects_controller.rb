class ProjectsController < ApplicationController 
    before_action :set_project, only: [:show, :edit, :update]

    def index
        #logged_in and current_user 
        @projects = Project.all 
        #Show the array of all the projects
    end 

    def show
    end 

    def new
        @project = Project.new 
    end 

    def create
        @project = Project.new(project_params)
        #Create a new project using the fed params
        if @project.valid? 
            @project.save
            redirect_to project_view(@project)
            #If the project is valid according to all validations in the model, save the project
            #Redirect to show the project
        else 
            render :new 
            #Or else render the new page again, which will autofill everything already entered
        end 
    end 

    def edit
    end 

    def update
        if @project.update(project_params)
            #If the project params update properly with validations from the model
            redirect_to project_path(@project)
            #Show the updated project
        else 
            render :edit 
            #Or else render the edit page again, for reasons above
        end 
    end 

    def destroy
        #can't remember go find this code
    end 

    private

    def project_params
        params.require(:project).permit(:name, :description, :summary, :created_at, :updated_at)
    end 

    def set_project 
        @project = Project.find(params[:id])
    end 
end 