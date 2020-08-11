class UsersController < ApplicationController
  before_action :get_user, only: [:show]
  before_action :authenticate, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:admin] = @user.admin
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  private 

  def user_params
    params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
  end

  def get_user
    @user = User.find(params[:id])
  end

end
