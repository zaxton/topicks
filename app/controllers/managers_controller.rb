class ManagersController < ApplicationController
    before_filter :authenticate
    
    def create
         @storage = Storage.find(params[:storage_id])
         @manager = @storage.managers.build(params[:manager])
         @manager.user_id = current_user.id
         if @manager.save
             redirect_to storage_managers_path(current_user)
         else
             render :index
         end
    end
    
    def index
        @storage = Storage.find(params[:storage_id])
        @title = "#{@storage.folder_name}"
        @managers = @storage.managers.paginate(:page => params[:page])
        @manager = @storage.managers.new
    end
    
    def destroy
        @manager = Manager.find(params[:id])
        @manager.destroy
        flash[:notice] = "Successfully deleted."
    end
end
