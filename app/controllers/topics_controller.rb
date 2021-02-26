class TopicsController < ApplicationController
    before_action :set_topic, only: [:show, :edit, :update]

    def index
        @topics = Topic.all 
    end 

    def show
    end 

    def new 
        @topic = Topic.new
    end 

    def create
        @topic = Topic.new(topic_params)
        if @topic.valid? 
            @topic.save 
            redirect_to @topic
        else 
            render :new
        end 
    end 

    def edit
    end 

    def update
        if @topic.update(topic_params)
            redirect_to @topic 
        else 
            render :edit 
        end 
    end 

    #def destroy
    #end 

    private

    def set_topic 
        @topic = Topic.find(params[:id])
    end 

    def topic_params
        params.require(:topic).permit(:name, :project_id, :list_id)
    end 
end 