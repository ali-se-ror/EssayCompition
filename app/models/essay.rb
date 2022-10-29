class Essay < ApplicationRecord
  belongs_to :user
  has_one :reward, dependent: :destroy

  before_save :store_length

  scope :today_essays_order_by_length, -> { joins(:user).select("essays.id, users.id as user_id, length").where("essays.created_at >= ? and essays.created_at <= ?", DateTime.now.beginning_of_day, DateTime.now.end_of_day).order(length: :desc) }
  scope :submitted, ->(user_id) { find_by("created_at >= ? AND user_id = ?", Time.zone.now.beginning_of_day, user_id) }

  private

  def store_length
    self.length = self.body.scan(/\S+/).size
  end
end
