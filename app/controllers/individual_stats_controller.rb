class IndividualStatsController < ApplicationController
    skip_before_action :authorized, only: [:stats]

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
        completed = IndividualStat.find_by(user_id: params[:user_id], song_id: params[:song_id]).update(completed: params[:completed])
        render json: completed
    end

    def stats
        song = Song.find_by(date: params[:date])
        number_of_completes = IndividualStat.where(completed: true, song_id: song.id).count
        mean_plays = IndividualStat.where(completed: true, song_id: song.id).average(:number_of_plays)
        median_plays = IndividualStat.median_plays(song)

        render json: {number_of_completes: number_of_completes, mean_plays: mean_plays, median_plays: median_plays}
    end

    private

    def play_params
        params.permit(:user_id, :song_id, :number_of_plays, :completed)
    end
end
