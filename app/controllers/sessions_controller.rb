class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user_name])
    if !@user.nil?
      session[:user_id] = @user.id
      session[:admin] = @user.admin
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id if :user_id
    session.delete :admin if :admin
    redirect_to root_path
  end
end
