class VideosController < ApplicationController
    before_filter :authenticate
    
    def create
        @upload = current_user.videos.build(params[:video])
        if @upload.save
            redirect_to uploads_path(current_user)
        else
            redirect_to root_path
        end
    end
end
