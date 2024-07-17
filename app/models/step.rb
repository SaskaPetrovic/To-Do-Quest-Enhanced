class Step < ApplicationRecord
  belongs_to :task

  validates :content, presence: true
end
