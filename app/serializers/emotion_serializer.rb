class EmotionSerializer < ActiveModel::Serializer
  attributes :id, :email, :emotion_on, :status

  def email
    object.user.email
  end
end
