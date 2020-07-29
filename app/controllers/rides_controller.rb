class RidesController < ApplicationController
before_action :ride


    def ride 
       # byebug
        @attraction=Attraction.find(params[:ride][:attraction_id]) 
        ride=Ride.new(:user_id => current_user.id,:attraction_id => @attraction.id)
        ride=ride.take_ride
        flash[:aaa]=ride
      
    redirect_to user_path(current_user)  
  end

    def create 

    end
    
    
    

    def show

    end
end


