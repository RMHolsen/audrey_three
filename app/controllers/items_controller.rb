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
        @list = List.find(params[:list_id])
        #A new item for the form_for object, and since it's a nested thing find the list based on the params given
    end 

    def create
        @list = List.find(params[:list_id])
        @item = Item.new(item_params)
        #Find the list and instantiate the new item
        if @item.valid?
            #Check the item's validity, we need at least a name and a type of material so we know what we're looking for
            @item = @list.items.build(item_params)
            @item.save 
            #Build the item and save the item
            redirect_to @list
            #Redirect to the full list
        else
            render :new
            #Or else do it all over again
        end 
    end 

    def edit
        @lists = List.all 
        #Restrict this only to user lists when login function is built
    end 

    def update
        @list = List.find(params[:list_id])
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
        params.require(:item).permit(:name, :material, :creator, :publication_date, :list_id, source_ids:[], sources_attributes: [:name])
    end 

    def list_params
        params.require(:list).permit(:name)
    end 
end 