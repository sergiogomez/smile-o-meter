# == Schema Information
#
# Table name: emotions
#
#  id         :integer          not null, primary key
#  status     :integer
#  user_id    :integer
#  emotion_on :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Emotion < ActiveRecord::Base
  belongs_to :user, inverse_of: :emotions

  enum status: [ :sad, :happy ]
end
