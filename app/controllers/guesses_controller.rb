class GuessesController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        guesses = Guess.all
        render json: guesses
    end

    def create
        guess = Guess.create!(guess_params)
        render json: guess, status: :created
    end

    def song_guesses
        guesses = Guess.where(user_id: params[:user_id], song_id: params[:song_id]).order(accuracy: :desc)
        render json: guesses
    end

    def user_guess_stats
        number_of_guesses_array = []
        song_ids = []

        guesses = Guess.where(user_id: params[:user_id])
        IndividualStat.where(user_id: params[:user_id]).each do |stat|
            if stat.completed
                song_ids << stat.song_id
            end
        end
        
        song_ids.each do |song_id|
            number_of_guesses_array<<Guess.where(user_id: params[:user_id], song_id: song_id).count
        end

        average = number_of_guesses_array.sum(0.0) / number_of_guesses_array.length
        render json: average
    end

    private

    def guess_params
        params.permit(:user_id, :abc, :accuracy, :song_id)
    end
end
