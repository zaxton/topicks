class CommentsController < ApplicationController
    
    def create
        @topic = Topic.find(params[:topic_id])
        @comment = @topic.comments.build(params[:comment])
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to comments_path(@topic)
        else
            render :index
        end
    end
    
    def index
        @topic = Topic.find(params[:topic_id])
        @comment = @topic.comments.new
        @comments = @topic.comments.paginate(:page => params[:page], :per_page => 1)
        @title = "#{@topic.content}"
    end
end
