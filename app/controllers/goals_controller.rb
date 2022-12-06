class GoalsController < ApplicationController
    def index
        goals = Goal.where(user_id: params[:user_id])
        render json: goals
    end

    def create
        goal = Goal.create!(goal_params)
        render json: goal
    end

    def update
        goal = Goal.find(params[:id]).update(complete: params[:complete])
        goals = Goal.where(user_id: params[:user_id])
        render json: goals
    end

    private

    def goal_params
        params.permit(:user_id, :content, :complete_by)
    end
end
