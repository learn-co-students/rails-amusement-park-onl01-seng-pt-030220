class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
    
    def take_ride
        user = self.user
        attraction = self.attraction
        if user.tickets > attraction.tickets
            if user.height > attraction.min_height
                # enough tickets & tall enough
                user.update(tickets: (user.tickets - attraction.tickets), 
                    nausea: (user.nausea + attraction.nausea_rating),
                    happiness: (user.happiness + attraction.happiness_rating))
                    "Thanks for riding the #{attraction.name}!"
            else
                # enough tickets & not tall enough
                "Sorry. You are not tall enough to ride the #{attraction.name}."
            end
        else
            if user.height > attraction.min_height
                # not enough tickets & tall enough
                "Sorry. You do not have enough tickets to ride the #{attraction.name}."
            else
                # not enough tickets & not tall enough
                "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
            end
        end
    end
end
