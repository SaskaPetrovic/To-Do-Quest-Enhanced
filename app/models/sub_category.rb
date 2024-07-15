class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :tasks
  has_many :achievements
end
