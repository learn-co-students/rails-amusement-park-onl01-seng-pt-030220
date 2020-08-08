class WelcomeController < ApplicationController
    skip_before_action :authenticated, only: [:home]

    def home
    end

end
