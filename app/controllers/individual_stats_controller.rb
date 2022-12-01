class IndividualStatsController < ApplicationController
    def song_plays
        number_of_plays = IndividualStat.find_by(song_id: params[:song_id], user_id: params[:user_id])
        render json: number_of_plays
    end

    def create
        play = IndividualStat.create(play_params)
        render json: play
    end

    def update
        play = IndividualStat.find_by(user_id: params[:user_id], song_id: params[:song_id])
        play.update(play_params)
        render json: play
    end

    def completed
        completed = IndividualStat.find_by(user_id: params[:user_id], song_id: params[:song_id]).update(completed: true)
    end

    private

    def play_params
        params.permit(:user_id, :song_id, :number_of_plays, :completed)
    end
end
