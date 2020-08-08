class UsersController < ApplicationController
skip_before_action :authenticated, only: [:new, :create]

def new
    @user = User.new
end

def create
    if !!(user = User.create(user_params))
      session[:user_id] = user.id
        redirect_to user_path(user)
    else
      render 'new'
    end
end

def show
  @user = User.find_by(id: params[:id])
end

def user_params
    params.require(:user).permit(:name, :height, :nausea, :admin, :password, :happiness, :tickets)
end



end
