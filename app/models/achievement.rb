class Achievement < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  belongs_to :task

  validates :title, presence: true
  validates :description, presence: true
end
