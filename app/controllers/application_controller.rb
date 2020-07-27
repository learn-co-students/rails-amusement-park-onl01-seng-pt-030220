class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :session_init


  #def session_init
   # session[:init] = true
  #end

   

    def current_user
        User.find_by(id:session[:user_id])
    end

end
