class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :essays, dependent: :destroy
  has_many :rewards
end
