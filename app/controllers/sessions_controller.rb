class SessionsController < ApplicationController

  def new
    
  end

  def create
    @user = User.find_by(name: params[:user_name])
    if !@user.nil? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:admin] = @user.admin
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session.destroy if :user_id
    redirect_to root_path
  end

end
