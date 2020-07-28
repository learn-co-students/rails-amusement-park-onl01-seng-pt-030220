class SessionController <  ApplicationController

     def  new
       @users=User.all
     end

    def signin
  
       @user=User.find_by(id:params[:user_name]) 
       if @user.present?
         session[:user_id] = @user.id
         flash[:notice] = " successfully signed in"
         redirect_to  user_path(@user)
       end        
    
    end
  
    private
  
end

