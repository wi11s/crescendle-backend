class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :create_with_data, :index, :update]
    rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

    def me
        render json: current_user, status: :ok
    end

    def create 
        user = User.create!(user_params)
        user.update(streak: 0)
        @token = encode_token(user_id: user.id)
        render json: {
            user: UserSerializer.new(user), 
            token: @token
        }, status: :created
    end

    def create_with_data
        user = User.create!(user_params)
        user.update(streak: params[:streak])
        user.update(interval_high_score: 0)
        IndividualStat.where(user_id: params[:id]).each do |stat|
            stat.update(user_id: user.id)
        end
        Guess.where(user_id: params[:id]).each do |guess|
            guess.update(user_id: user.id)
        end
        @token = encode_token(user_id: user.id)
        render json: {
            user: user, 
            token: @token
        }, status: :created
    end

    def update
        user = User.find(params[:id]).update(user_params)
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

    def update_interval_high_score
        user = User.find(params[:id])
        user.update(interval_high_score: params[:interval_high_score])
        render json: user
    end


    private

    def user_params 
        params.permit(:email, :name, :password, :password_confirmation)
    end

    def handle_invalid_record(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
