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
end
