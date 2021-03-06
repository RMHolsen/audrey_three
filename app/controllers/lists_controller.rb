class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index 
        #Possibly a login method goes here so the person can only view all their lists, rather than all lists
        @lists = List.all 
    end 

    def show
        @items = @list.items 
        #For simpler iterating over in the view
    end 

    def new
        @list = List.new
        @topics = Topic.all 
        #Eventually this is going to have to be restricted by user, I think. That's going to be an entire day of work, ugh.
        #This could be where the scope method goes actually
    end 

    def create
        @list = List.new(list_params)
        @topic_ids = params[:list][:topic_ids]
        @topic_ids.shift
        #Why do I always have a blank one at the top
        #Find the chosen topics by the id in params
        if @list.valid?
            @list.save
            #Save the list if the list is valid
            @topic_ids.each do |t|
                topic = Topic.find(t)
                topic.list = @list 
                topic.save 
            end 
            #Assign the list to each topic in the topic ids.
            redirect_to @list 
        else 
            render :new
        end 
    end 

    def edit
        @topics = Topic.all 
        #Again, to iterate over in the view, also going to need to be restricted by user.
    end 

    def update
        @topic_ids = params[:list][:topic_ids]
        @topic_ids.shift 
        if @list.update(list_params)
            @topic_ids.each do |t|
                 topic = Topic.find(t)
                 topic.list = @list 
                 topic.save 
            end 
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
        params.require(:list).permit(:name, topic_ids: [])
    end 

    # def project_params
    #     params.require(:project).permit(:name)
    # end 
end 