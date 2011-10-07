class ProfilesController < ApplicationController
    before_filter :authenticate
    
    def new
        @title = "Edit Your Information"
        @profile = Profile.new
        @type = %w(Rational Artisan Idealist Guardian)
    end
    
    def create
        @profile = current_user.profiles.build(params[:profile])
        if @profile.save
            redirect_to current_user
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
end
