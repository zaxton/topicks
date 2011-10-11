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
        @title = "#{current_user.username}/Edit Settings"
        @profile = Profile.find(params[:id])
    end
    
    def update
        @profile = Profile.find(params[:id])
        if @profile.update_attributes(params[:profile])
           flash[:success] = "Profile Updated!"
           redirect_to current_user
        else
           @title = "#{current_user.username}/Edit Settings"
           render 'edit'
        end
    end
    
    def destroy
    end
end
