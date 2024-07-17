class Task < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :steps, dependent: :destroy

  validates :title, :description, :sub_category, :urgence, presence: true
  validates :urgence, inclusion: { in: ['low', 'medium', 'high'] }
end
