module UserHelper
  def reward_points essay
    essay.reward&.points ? essay.reward.points : "N/A"
  end

  def reward_position essay
    essay.reward&.position ? essay.reward.position: "N/A"
  end
end
