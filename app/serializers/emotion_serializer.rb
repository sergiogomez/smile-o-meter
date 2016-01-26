class EmotionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :emotion_on, :status
end
