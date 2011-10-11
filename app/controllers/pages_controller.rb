class PagesController < ApplicationController
    
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
    end
    
    def help
    end
    
    def terms
    end
    
    def privacy
    end
end
