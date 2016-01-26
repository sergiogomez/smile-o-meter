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

  scope :last_week, lambda { where('emotion_on <= ? AND emotion_on > ?', Date.today, Date.today - 1.week) }

  validates :user_id, presence: true
  validates :emotion_on, presence: true, uniqueness: { scope: :user_id }
end
