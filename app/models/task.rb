class Task < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true
  validates :title, :description, :sub_category, :urgence, presence: true
  validates :urgence, inclusion: { in: ['low', 'medium', 'high'] }
  validates :status, inclusion: { in: ['not_started', 'in_progress', 'completed'] }

  scope :with_completed_steps, -> {
    joins(:steps).where(steps: { completed: true }).distinct
  }

  scope :with_uncompleted_steps, -> {
    joins(:steps).where(steps: { completed: false }).distinct
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
      ['STR']
    when 'Work/School'
      ['INT']
    when 'Leisure & Social'
      ['CHA']
    when 'Health & Wellness'
      ['DEX']
    when 'Personal Growth'
      ['MANA']
    end
  end

  private

  def completed?
    status == 'completed'
  end

end
