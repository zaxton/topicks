module ApplicationHelper

    # Sets the title for the web site- use @title in controllers
    def title
        base_title = "Topicks"
        if @title.nil?
            "Welcome to #{base_title}"
        else
            "#{@title} @ #{base_title}"
        end
    end
    
    # Finds the current user's browser. Used for noscript
    def client_browser_name
        user_agent = request.env['HTTP_USER_AGENT'].downcase
        if user_agent =~ /msie/i
            "Microsoft"
        elsif user_agent =~ /applewebkit/i
            "Apple or Google"
        elsif user_agent =~ /Chrome/i
            "Google"
        elsif user_agent =~ /Mozilla/i
            "Mozilla"
        else
            "your browser"
        end
    end
    
    # The site's logo
    def logo
        logo = image_tag("logo.png", :alt => "Topick")
    end
    
    def site
        site = image_tag("site.png", :alt => "Topick")
    end
    
    def home_picture
        home_picture = image_tag("topics.jpg", :alt => "Photo", :size => "650x450")
    end
    
    def movie_art
        movie_art = image_tag("clapboard.png", :alt => "Entertainment", :size => "100x100")
    end 
end
