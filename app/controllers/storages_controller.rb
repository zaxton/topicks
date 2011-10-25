class StoragesController < ApplicationController
    before_filter :authenticate
    
    def create
        @storage = current_user.storages.build(params[:storage])
        if @storage.save
            redirect_to storages_path(current_user)
        else
            render :index
        end
    end
    
    def index
        @title = "#{current_user.username}'s Folders"
        @storage = Storage.new
        @storages = current_user.storages.search(params[:search]).paginate(:page => params[:page])
    end
end
