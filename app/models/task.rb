class Task < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true
  validates :title, :description, :sub_category, :urgence, presence: true
  validates :urgence, inclusion: { in: ['low', 'medium', 'high'] }

  URGENCY_MULTIPLIERS = {
    'low' => 1,
    'medium' => 2,
    'high' => 3
  }

  def calculate_rewards
    base_xp = 100
    multiplier = URGENCY_MULTIPLIERS[urgence] || 1
    base_xp * multiplier.to_i
  end

  def completed?
    steps.all?(&:completed?)
    self.status = "completed"
    self.rewards = "#{calculate_rewards}xp"

    create_achievement if should_create_achievement?
  end

  def progress
    steps.select(&:completed?).count.to_f / steps.count
  end

  def progress_percentage
    progress * 100
  end

  private

  def should_create_achievement?
    # Ajoute ici les conditions pour créer un achievement, par exemple, si la tâche est une tâche définie dans la seed
    # Task.create!(title: "Moving the couch", description: "Move the couch from the living room to the bedroom", status: "pending", urgence: "high", time: Time.now , rewards: "100xp", user: user, sub_category: rogue1)
    if title == "Moving the couch"
      return true
    end
  end

  def create_achievement
    Achievement.create!(
      title: "Achievement for #{title}",
      description: "Completed the task: #{title}",
      user: user,
      task: self,
      sub_category: sub_category
    )
  end
end
