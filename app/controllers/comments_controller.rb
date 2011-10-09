class CommentsController < ApplicationController
    
    def create
        @topic = Topic.find(params[:topic_id])
        @comment = @topic.comments.build(params[:comment])
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to root_path
        else
            render :new
        end
    end
    
    def index
        @topic = Topic.find(params[:topic_id])
        @comment = @topic.comments.new
        @comments = @topic.comments.all
        @title = "#{@topic.content}"
    end
end
