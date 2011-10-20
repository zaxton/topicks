class CommentsController < ApplicationController
    before_filter :authenticate
    respond_to :html, :js
    
    def create
        @topic = Topic.find(params[:topic_id])
        @comment = @topic.comments.build(params[:comment])
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to topic_comments_path(@topic)
        else
            render :index
        end
    end
    
    def index
        @topic = Topic.find(params[:topic_id])
        @comment = @topic.comments.new
        @title = "#{@topic.content}"
        last = params[:last].blank? ? Time.now + 1.second : Time.parse(params[:last])
        @comments = @topic.comments.feed(last)
    end
end
