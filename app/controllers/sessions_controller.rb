class SessionsController < ApplicationController
    
    def new
        @title = "Sign In"
        @user = User.new
    end

    def create
        user = User.authenticate(params[:session][:email],
                                 params[:session][:password])
        if user.nil?
            flash[:error] = "Incorrect email/password combination. Please try again."
            @title = "Sign in"
            @user = User.new
            render :new
        else
            sign_in user
            redirect_back_or root_url
        end
    end

    def destroy
        sign_out
        redirect_to goodby_url
    end
end
