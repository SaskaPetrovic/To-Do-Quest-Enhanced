class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :tasks
  has_many :achievements

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
