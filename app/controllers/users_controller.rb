class UsersController < ApplicationController
    before_filter :authenticate, :except => :create
    
    def create
        @user = User.new(params[:user])
        if @user.save
            sign_in @user
            redirect_to root_path
        else
            render 'pages/home'
        end
    end
    
    def show
        @user = User.find(params[:id])
        @title = "#{@user.username}"
    end
    
    def index
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
end
