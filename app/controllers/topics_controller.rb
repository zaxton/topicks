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
    
    def index
    end
    
    def entertainment
        @title = "Entertainment"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Entertainment").all
        @heading = "Welcome To Topicks Entertainment"
        @tip = "Post Anything You Feel Relates to Entertainment"
    end
    
    def events
        @title = "Events"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Events").all
        @heading = "Welcome To Topicks Events"
        @tip = "Post Anything You Feel Relates to Events"
    end
    
    def news
        @title = "News"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "News").all
        @heading = "Welcome To Topicks News"
        @tip = "Post Anything You Feel Relates to News"
    end
end
