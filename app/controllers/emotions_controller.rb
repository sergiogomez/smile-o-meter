class EmotionsController < ApplicationController
  before_filter :find_user

  def index
    render json: @user.emotions
  end

  def show
    render json: @user.emotions.find(params[:id])
  end

  def create
    @emotion = @user.emotions.new(
      status: params[:status],
      emotion_on: params[:emotion_on]
      )
    if @emotion.save
      render json: @emotion, status: 201
    else
      render json: { error: "Emotion could not be created" }, status: 422
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

end
