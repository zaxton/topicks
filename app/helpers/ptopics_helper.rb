module PtopicsHelper
    def search_users
             @user = current_user.following.where("username like ?", "%#{params[:q]}%")
             respond_to do |format|
                 format.html
                 format.json { render :json => @user.map(&:attributes)}
             end
     end
end
