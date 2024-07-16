class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :achievements

  validates :username, :roles, presence: true
  validates :email, uniqueness: true
  validates :experience, :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
