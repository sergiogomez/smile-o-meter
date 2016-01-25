class User < ActiveRecord::Base
  has_many :emotions, inverse_of: :user, dependent: :destroy
end
