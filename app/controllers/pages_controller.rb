class PagesController < ApplicationController
    before_filter :authenticate, :only => :help
    
    def home
        @user = User.new
        if signed_in?
            @title = "Topicks Home"
            @posts = current_user.topics.limit(10)
        end
    end
    
    def goodby
    end
    
    def topicks
        @title = "Topicks"
    end
    
    def help
        @title = "Help"
        @topics = Topic.where('category = ?', "Help").all
        @topic = Topic.new
        @heading = "Topicks_help"
        @tip = "This is the topicks support page. Ask a question or answer one."
    end
    
    def terms
    end
    
    def privacy
    end
end
