class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def too_short
    user.height < attraction.min_height
  end

  def too_poor
    user.tickets < attraction.tickets
  end

  def take_ride
    if too_short && too_poor
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif too_short
      "Sorry. You are not tall enough to ride the #{attraction.name}."  
    elsif too_poor
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.update(tickets: user.tickets - attraction.tickets, nausea: user.nausea + attraction.nausea_rating, happiness: user.happiness + attraction.happiness_rating)
      "Thanks for riding the #{attraction.name}!"
    end
  end


end
