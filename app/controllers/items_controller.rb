class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update]
    
    def index
        @items = Item.all 
    end 

    def show 
    end 

    def new
        @item = Item.new 
    end 

    def create
        @item = Item.new(item_params)
        if @item.valid?
            @item.save
            redirect_to @item
        else
            render :new
        end 
    end 

    def edit
    end 

    def update
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
        params.require(:item).permit(:name, :material, :creator, :publication_date)
    end 
end 