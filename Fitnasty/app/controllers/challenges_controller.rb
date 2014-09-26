class ChallengesController < ApplicationController

  def index
    #returns specific users accepted challenges
    p params
    challenges = User.find(params[:user_id]).challenges
    render json: challenges
  end

  def accepted
    user_challenges = User.find(params[:user_id]).user_challenges.where(accepted?: true)
    accepted_challenges = user_challenges.map do |user_challenge| Challenge.find(user_challenge.challenge_id) end
    render json: accepted_challenges
  end

  def create

  end

  def edit

  end

  def update

  end

  def show
    challenge = Challenge.find(params[:id])
    render json: challenge
  end

  def destroy

  end

  def search
    tag = Tag.where(name: params[:keyword]).first
    if tag
      render json: tag.challenges
    else
      render json: {warning: "No challenge tags match that keyword."}
    end
  end
end