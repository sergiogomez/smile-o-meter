class Emotion < ActiveRecord::Base
  belongs_to :user, inverse_of: :emotions

  enum status: [ :sad, :happy ]
end
