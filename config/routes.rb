Topik::Application.routes.draw do
  
    get 'sessions/new'
    
    resources :sessions
    resources :users 
    resources :profiles
    resources :bookmarks
    resources :relationships
    resources :password_resets
    resources :videos
    resources :ptopics
    resources :tags
     
    resources :topics do
        resources :comments
    end
    
    resources :storages do
        resources :managers
    end
    
    match '/uploads/:id', :to => 'users#uploads', :as => 'uploads'
    
    get '/user_ptopics', :to => 'ptopics#user_ptopics'
    
    controller :topics do
        match '/movies', :to => :movies
    
        match '/games' => :games

        match '/tv' => :tv
    
        match '/sports' => :sports
    
        match '/world' => :world
    
        match '/celeb' => :celb
        
        match '/people' => :people
    
        match '/places' => :places
    
        match '/things' => :things
        
        match '/grapevine' => :grapevine
    end
    
    controller :pages do
        root :to => :home
        
        match '/goodby' => :goodby
    
        match '/topicks' => :topicks
        
        match '/help' => :help
        
        match '/terms' => :terms
        
        match '/privacy' => :privacy
           
        match '/entertainment', :to => :entertainment
        
        match '/events', :to => :events
        
        match '/news', :to => :news
    end
    
    controller :sessions do
        match '/signin' => :new
        
        match '/signout' => :destroy
    end
  
end
