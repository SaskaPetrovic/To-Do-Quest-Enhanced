class Task < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true
  validates :title, :description, :sub_category, :urgence, presence: true
  validates :urgence, inclusion: { in: ['low', 'medium', 'high'] }

  scope :with_completed_steps, -> {
    joins(:steps).where(steps: { completed: true }).distinct
  }

  attr_accessor :category_id

  def xp_reward
    case urgence
    when 'low'
      10
    when 'medium'
      20
    when 'high'
      30
    else
      0
    end
  end

  def category_rewards
    case sub_category.category.title
    when 'Domestic'
      ['+1 STR']
    when 'Work/School'
      ['+1 INT']
    when 'Leisure & Social'
      ['+1 CHA']
    when 'Health & Wellness'
      ['+1 DEX ']
    when 'Personal Growth'
      ['+1 MANA']
    end
  end
end
