class Category < ApplicationRecord
  has_many :sub_category

  validates :title, presence: true
  validates :description, presence: true
end
