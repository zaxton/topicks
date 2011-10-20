module PagesHelper
    
    def founderOne 
        founderOne = image_tag("zach.png", :alt => "Zach", :size => "150x150")
    end
    
    def founderTwo
        founderTwo = image_tag("dustin", :alt => "Dustin", :size => "150x150")
    end
    
    def entertain_count
        entertain_count = Topic.where('category = ?', "Entertainment").count
    end
    
    def news_count
        news_count = Topic.where('category = ?', "News").count
    end
    
    def events_count 
        events_count = Topic.where('category = ?', "Events").count
    end
end
