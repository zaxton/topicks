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
        @title = "All Topics"
        @topics = Topic.search(params[:search]).paginate(:per_page => 33, :page => params[:page])
    end
    
    def grapevine
        @title = "The Grape Vine"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Vine").all
        @heading = "Welcome to the Grape Vine"
        @tip = "Post Anything, Annoynimously"
        @category = "Vine"
    end
    
    def movies
        @title = "Movies"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Movies").all
        @heading = "Entertainment > Movies"
        @tip = "Post Anything You Feel Relates to Movies"
        @category = "Movies"
    end
    
    def games
        @title = "Games"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Games").all
        @heading = "Entertainment > Games"
        @tip = "Post Anything You Feel Relates to Games"
        @category = "Games"
    end
    
    def tv
        @title = "TV"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "TV").all
        @heading = "Entertainment > TV"
        @tip = "Post Anything You Feel Relates to Television"
        @category = "TV"
    end
    
    def sports
        @title = "Sports"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Sports").all
        @heading = "News > Sports"
        @tip = "Post Anything You Feel Relates to Sports"
        @category = "Sports"
    end
    
    def world
        @title = "World"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "World").all
        @heading = "News > World"
        @tip = "Post Anything You Feel Relates to World News"
        @category = "World"
    end
    
    def celeb
        @title = "Celebrity"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Celeb").all
        @heading = "News > Celebrity"
        @tip = "Post Anything You Feel Relates to Celebrity News"
        @category = "Celeb"
    end
    
    def people
        @title = "People"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "People").all
        @heading = "Events > People"
        @tip = "Post Anything You Feel Relates to People"
        @category = "People"
    end
    
    def places
        @title = "Places"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Places").all
        @heading = "Events > Places"
        @tip = "Talk About a Place"
        @category = "Places"
    end
    
    def things
        @title = "Things"
        @topic = Topic.new
        @topics = Topic.where('category = ?', "Things").all
        @heading = "Events > Things"
        @tip = "Post General Events"
        @category = "Things"
    end
end
