class TagsController < ApplicationController
    
    def create
        @tag = current_user.tags.build(params[:tag])
        @user = User.where("username like ?", "%#{params[:q]}%") 
        @tokens = @user.map(&:id).to_json.to_s
        @tag.tag_id = eval(@tokens).last
        if @tag.save
            redirect_to current_user
        else
            redirect_to root_path
        end
    end
end
