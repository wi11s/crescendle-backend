class PracticesController < ApplicationController
    def index
        practices = Practice.all
        render json: practices
    end
end
