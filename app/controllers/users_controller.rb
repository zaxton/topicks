class UsersController < ApplicationController
    before_filter :authenticate, :except => [:new, :create]
    before_filter :correct_user, :only => [:edit, :update]
    
    def new
        @title = "Create A New Account"
        @user = User.new
    end
    
    def create
        @user = User.new(params[:user])
        if @user.save
            sign_in @user
            flash[:success] = "Profile Created"
            redirect_to root_path
        else
            render 'pages/home'
        end
    end
    
    def show
        @user = User.find(params[:id])
        @title = "#{@user.username}"
        @bookmark = Bookmark.new
        @bookmarks = @user.bookmarks.limit(5)
        @comments = Comment.where('user_id = ?', @user.id)
    end
    
    def index
        @title = "Find People"
        @users = User.search(params[:search]).paginate(:per_page => 33, :page => params[:page])    
    end
    
    def edit
        @title = "#{current_user.username}/Edit Account"
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
          flash[:success] = "Profile Updated!"
          redirect_to @user
        else
          @title = "Edit User Info"
          render 'edit'
        end
    end
    
    def destroy
        user = User.find(params[:id])
        	if current_user?(user)
        		flash[:error] = "What kind of admin are you?"
        	else
        	    user.destroy
        		flash[:success] = "User Deleted"
        	end
        redirect_to users_path
    end
    
    def uploads
        @user = User.find(params[:id])
        @title = "#{@user.username}'s Shared Folders"
        @upload = Video.new
        @videos = @user.videos.paginate(:page => params[:page])
    end
   
    private
    
    def correct_user
       @user = User.find(params[:id])
       redirect_to(root_path) unless current_user?(@user)
     end
end
