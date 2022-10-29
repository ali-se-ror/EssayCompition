class CalculateRewardsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    total_points = 15
    Essay.today_essays_order_by_length.group_by(&:length).each_with_index do |essays, index|
      essays.second.each do |easy|
        position = index.next < 4 ? index.next : 0
        Reward.create(points: total_points, position: position, essay_id: easy.id, user_id: easy.user_id)
      end
      total_points -= 5 unless total_points == 0
    end
    puts "Rewards distributed successfuly for #{Date.today}"
  end
end
