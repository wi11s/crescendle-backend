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

    private

    def guess_params
        params.permit(:user_id, :abc, :accuracy, :song_id)
    end
end
