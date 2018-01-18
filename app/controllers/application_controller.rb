class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private
    def authorize_admin!
       user_signed_in?
       
       unless current_user.admin?
            flash[:alert] = "You must be an admin to do that."
            redirect_to root_path
       end
    end
end
