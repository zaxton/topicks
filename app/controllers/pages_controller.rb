class PagesController < ApplicationController
    
    def home
        @user = User.new
        if signed_in?
            @title = "Home"
        end
    end
    
    def goodby
    end
    
    def about
    end
    
    def help
    end
    
    def terms
    end
    
    def privacy
    end
end
