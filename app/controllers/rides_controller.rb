class RidesController < ApplicationController
   def create
    ride = Ride.create(ride_params)
    flash = ride.take_ride 
    redirect_to user_path(ride.user), flash: {message: flash }

   end

   private 

   def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
   end

end
