class SourcesController < ApplicationController 
before_action :set_source, only: [:show, :edit, :update]
    def index
        @sources = Source.all 
        #Definitely want this to be publicly available
        #A scope method could also be used here for "show all free sources/show all paid sources"
    end 

    def show 
    end 

    def new
        @source = Source.new
    end 

    def create
        @source = Source.new(source_params)
        if @source.valid? 
            @source.save 
            redirect_to @source 
        else 
            render :new 
        end 
    end 

    def edit
    end 

    def update
        if @source.update(source_params)
            redirect_to @source
        else 
            render :edit 
        end 
    end 

    def free 
        #@sources = Source.CLASS-METHOD-GOES-HERE
    end 

    def paywall
        #@sources = Source.CLASS-METHOD-GOES-HERE
    end 

    #def destroy
    #end 

    private

    def set_source 
        @source = Source.find(params[:id])
    end 

    def source_params
        params.require(:source).permit(:name, :location, :contact, :fee)
    end 
end 