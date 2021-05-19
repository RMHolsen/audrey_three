class SourcesController < ApplicationController 
before_action :set_source, only: [:show, :edit, :update]

    def index
        @sources = Source.all 
        #Definitely want this to be publicly available
        #A scope method could also be used here for "show all free sources/show all paid sources"
        #Doublecheck the petfinder video part 2
    end 

    def show 
    end 

    def new
        @source = Source.new
    end 

    def create
        @item = Item.find(params[:id])
        @source = Source.new(source_params)
        if @source.valid? 
            @source.save 
            redirect_to @source 
        else 
            redirect_to item_path(@item)
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
        @sources = Source.free
        #@pets = Pet.search_by_age(params[:age]).order_by_age 
    end 

    def paywall
        @sources = Source.paywall
        #@pets = Pet.search_by_age(params[:age]).order_by_age 
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