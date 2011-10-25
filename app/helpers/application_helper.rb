module ApplicationHelper
    
    # Sets the title for the web site- use @title in controllers
    def title
        if @title.nil?
            "Welcome to Topicks"
        else
            "#{@title}"
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
    
    def vine_art
        vine_art = image_tag("grapevine.png", :alt => "Grape Vine", :size => "100x100")
    end
    
    def movie_art
        movie_art = image_tag("clapboard.png", :alt => "Entertainment", :size => "100x100")
    end 
    
    def news_art
        news_art = image_tag("newspaper.gif", :alt => "News", :size => "100x100")
    end
    
    def events_art
        events_art = image_tag("events-icon.gif", :alt => "Events", :size => "100x100")
    end 
    
    def app_store_logo
        app_store_logo = image_tag("app-store-badge.png", :alt => " ", :size => "200x75")
    end
    
    def folder
        folder = image_tag("folder.png", :alt => "Folder", :size => "45x45")
    end
    
    def file
        file = image_tag("file.png", :alt => "File", :size => "30x30")
    end
    
    # Photos for bottom bar
    def home_pic
        home_pic = image_tag("home.png", :alt => "Home", :size => "20x20")
    end
    
    def question_mark
        question_mark = image_tag("question_mark.png", :alt => "Home", :size => "25x25")
    end
end
