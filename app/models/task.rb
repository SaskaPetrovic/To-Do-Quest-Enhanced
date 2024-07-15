class Task < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :steps
end
