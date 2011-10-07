Topik::Application.routes.draw do
  
    get 'sessions/new'
    
    resources :sessions
    resources :users
    resources :topics
    resources :comments 
    resources :profiles
    resources :bookmarks
    
    match '/entertainment', :to => 'topics#entertainment'
    match '/events', :to => 'topics#events'
    match '/news', :to => 'topics#news'
  
    controller :pages do
        root :to => :home
        
        match '/goodby' => :goodby
    
        match '/about' => :about
        
        match '/help' => :help
        
        match '/terms' => :terms
        
        match '/privacy' => :privacy
        
        match '/forum' => :forum
    end
    
    controller :sessions do
        match '/signin' => :new
        
        match '/signout' => :destroy
    end
  
end
