class RidesController < ApplicationController
  def create
    user = User.find_by(id: session[:user_id])
    attraction = Attraction.find_by(id: params[:attraction_id])
    ride = Ride.new
    ride.user = user
    ride.attraction = attraction
    redirect_to user_path(user), notice: "#{ride.take_ride}"
  end
end