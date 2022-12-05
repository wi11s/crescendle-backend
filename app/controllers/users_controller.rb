class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]
    rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

    def me
        render json: current_user, status: :ok
    end

    def create 
        user = User.create!(user_params)
        @token = encode_token(user_id: user.id)
        render json: {
            user: UserSerializer.new(user), 
            token: @token
        }, status: :created
    end

    def update_streak
        user = User.find(params[:id])
        user.complete_todays_song(params[:date])
        render json: user
    end

    private

    def user_params 
        params.permit(:email, :name, :password)
    end

    def handle_invalid_record(e)
            render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
