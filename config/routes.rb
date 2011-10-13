Topik::Application.routes.draw do
  
    get 'sessions/new'
    
    resources :sessions
    resources :users 
    resources :profiles
    resources :bookmarks
    resources :relationships
    resources :password_resets
    
    resources :topics do
        resources :comments
    end
    
    match '/entertainment', :to => 'topics#entertainment'
    match '/events', :to => 'topics#events'
    match '/news', :to => 'topics#news'
  
    controller :pages do
        root :to => :home
        
        match '/goodby' => :goodby
    
        match '/topicks' => :topicks
        
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
