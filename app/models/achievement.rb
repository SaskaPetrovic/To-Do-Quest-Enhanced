class Achievement < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :sub_category_id, presence: true
end
