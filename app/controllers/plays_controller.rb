class PlaysController < ApplicationController
    def song_plays
        number_of_plays = Play.find_by(song_id: params[:song_id], user_id: params[:user_id])
        render json: number_of_plays
    end

    def create
        play = Play.create(play_params)
        render json: play
    end

    def update
        play = Play.find_by(user_id: params[:user_id], song_id: params[:song_id])
        play.update(play_params)
        render json: play
    end

    private

    def play_params
        params.permit(:user_id, :song_id, :number_of_plays)
    end
end
