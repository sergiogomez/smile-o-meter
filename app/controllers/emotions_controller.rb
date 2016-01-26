class EmotionsController < ApplicationController
  before_filter :find_user

  def index
    @emotions = @user.emotions.last_week.order('emotion_on DESC')

    render json: @emotions
  end

  def show
    @emotion = @user.emotions.find(params[:id])

    render json: @emotion
  end

  def create
    @emotion = @user.emotions.new(emotion_params)

    if @emotion.save
      render json: @emotion, status: :created
    else
      render json: @emotion.errors, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def emotion_params
    params.require(:emotion).permit(:status, :emotion_on)
  end

end
