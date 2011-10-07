class TopicsController < ApplicationController
    before_filter :authenticate
    
    def new
    end
    
    def create
        @topic = current_user.topics.build(params[:topic])
        if @topic.save
            flash[:success] = "Topic Created"
            redirect_to root_path
        else
            render 'pages/home'
        end
    end
    
    def show
    end
    
    def entertainment
        @title = "Entertainment"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Entertainment").all
        @heading = "Welcome To Topicks Entertainment"
    end
    
    def events
        @title = "Events"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Events").all
        @heading = "Welcome To Topicks Events"
    end
    
    def news
        @title = "News"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "News").all
        @heading = "Welcome To Topicks News"
    end
end
