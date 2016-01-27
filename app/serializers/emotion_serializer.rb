class EmotionSerializer < ActiveModel::Serializer
  attributes :id, :emotion_on, :status

  def email
    object.user.email
  end
end
