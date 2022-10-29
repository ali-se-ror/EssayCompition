class Reward < ApplicationRecord
  belongs_to :essay
  belongs_to :user
end
