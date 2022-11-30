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

    private

    def guess_params
        params.permit(:user_id, :abc, :accuracy, :song_id)
    end
end
