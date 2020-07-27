require 'pry'
class UsersController < ApplicationController

    def index 

    end
    
    def new
        #@user=User.new
    end

    def create

    #params[:user][:admin].present?
     if params[:user][:name].present? || params[:user][:password].present? || params[:user][:nausea].present? || !params[:user][:tickets].present? || !params[:user][:height].present?
        @user=User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user) 
     else
        redirect_to users_path
     end
       
    end

    def show
        require_login
        @user=User.find_by(id:params[:id])
    end

    def edit
        
    end
    def update
        
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    #def current_user
     #   User.find_by(id:session[:user_id])
    #end

    private

      def user_params
      
         params.require(:user).permit(:name,:password,:nausea,:happiness,:tickets,:height,:admin)
         
      end
    
  
    def require_login
        redirect_to root_path    if !current_user
    end


end


