# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string(255)      not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  authentication_token :string(255)
#  password_digest      :string(255)
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#

class User < ActiveRecord::Base
  has_many :emotions, inverse_of: :user, dependent: :destroy

  validates :email, presence: true

  after_create :generate_authentication_token!

  has_secure_password

  private

  # Generate a session token
  def generate_authentication_token!
    self.authentication_token = Digest::SHA1.hexdigest("#{Time.now}-#{self.id}-#{self.updated_at}")
    self.save
  end

end
