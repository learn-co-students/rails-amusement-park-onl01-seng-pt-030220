class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        tickets_covered, tall_enough = meets_requirements
        if tickets_covered && tall_enough
            ride_update
        elsif !(tickets_covered) && tall_enough
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !(tall_enough) && tickets_covered
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif !(tickets_covered) && !(tall_enough)
            "Sorry. You do not have enough tickets to ride the #{attraction.name}." + " " + "You are not tall enough to ride the #{attraction.name}."
        end
    end

    def ride_update
        update_ticket = self.user.tickets - self.attraction.tickets
        update_happiness = self.user.happiness + self.attraction.happiness_rating
        update_nausea = self.user.nausea + self.attraction.nausea_rating
        self.user.update(
            :tickets => update_ticket,
            :happiness => update_happiness,
            :nausea => update_nausea
        )
        "Thanks for riding the #{self.attraction.name}!"
    end

    def meets_requirements
        tickets_covered = false
        tall_enough = false
        if self.user.tickets >= self.attraction.tickets
            tickets_covered = true
        end
        if self.user.height >= self.attraction.min_height
            tall_enough = true
        end
        return [tickets_covered, tall_enough]
    end

end
