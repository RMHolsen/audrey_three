class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    
    # def index
    #     Leaving this here just in case, but there doesn't really seem to be a need for an items index right now.
    #     @items = Item.all 
    # end 

    def show 
        @sources = @item.sources 
    end 

    def new
        @item = Item.new 
        @lists = List.all 
        #Restrict this only to user lists when login function is built 
        #@list = List.find(params[:list_id])
    end 

    def create
        #@list = List.find(params[:list_id])
        #@item = @list.items.build(item_params)
        @item = Item.new(item_params)
        @item.list = List.find_or_create_by(list_params)
        if @item.valid?
            @item.save
            #If @item.source_ids == true, redirect_to @list
            #else redirect_to @list, flash message you may want to add more information about the source
            redirect_to @list
        else
            render :new
        end 
    end 

    def edit
        @lists = List.all 
        #Restrict this only to user lists when login function is built
    end 

    def update
        #@list = List.find(params[:list_id])
        if @item.update(item_params)
            redirect_to @item
        else 
            render :edit 
        end 
    end 

    # def destroy
    # end 

    private

    def set_item
        @item = Item.find(params[:id])
    end 

    def item_params
        params.require(:item).permit(:name, :material, :creator, :publication_date, source_ids:[], sources_attributes: [:name])
    end 

    def list_params
        params.require(:list).permit(:name)
    end 
end 