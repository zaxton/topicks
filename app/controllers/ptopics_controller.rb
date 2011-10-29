class PtopicsController < ApplicationController
    include PtopicsHelper
    
    def new
    end
    
    def create
        @ptopics = current_user.ptopics.build(params[:ptopic])
        if @ptopics.save
            redirect_to ptopic_path(@ptopics)
        else
            render 'pages/home'
        end
    end
    
    def show
        @ptopics = Ptopic.find(params[:id])
        @title = "#{@ptopics.name}"
        @tags = Tag.where('ptopic_id =?', @ptopics.id)
        @tag = Tag.new
    end
    
    def index
        @title = "#{current_user.username}'s Private Topics"
        @ptopics = current_user.ptopics.paginate(:page => params[:page])
    end
    
    def destroy
    end
    
    def user_ptopics
        search_users
    end
end
