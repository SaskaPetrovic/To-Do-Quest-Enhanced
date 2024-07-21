class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :achievements

  #validates :username, :roles, presence: true

  validates :email, uniqueness: true

  def stats
    {
      intelligence: self.intelligence,
      mana: self.mana,
      dexterity: self.dexterity,
      strength: self.strength,
      charisma: self.charisma
    }
  end

  def memo
    self[:memo] || 'No memo available'
  end

  def status
    self[:status] || 'No status available'
  end

  def experience_percentage
    max_experience = 1000  #XP REQUIT POUR MONTER UN NIVEAU
    #CALCULE DE LA BARRE D'XP
    [(experience.to_f / max_experience) * 100, 100].min
    #SI VOUS COMPRENEZ PAS JE DIVISE L'XP DU JOUEUR ACTUEL PAR L'XP MAX FOIS 100 POUR AFFICHER EN %
  end

  def level
    self[:level] || 1
  end
end
