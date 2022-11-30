class SongsController < ApplicationController
    def daily
        song = Song.find_by(date: params[:date])
        render json: song
    end
end
