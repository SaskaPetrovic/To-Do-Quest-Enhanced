class User < ApplicationRecord
  ROLES_CRITERIA = {
    'Mage' => { mana: 5 },
    'Rogue' => { int: 5 },
    'Ranger' => { dex: 5 },
    'Knight' => { str: 5 },
    'Bard' => { cha: 5 }
  }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :achievements

  validates :email, uniqueness: true

  def stats
    {
      strength: self.str,
      intelligence: self.int,
      mana: self.mana,
      dexterity: self.dex,
      charisma: self.cha
    }
  end

  def memo
    self[:memo] || 'No memo available'
  end

  def status
    self[:status] || 'No status available'
  end

  def experience_percentage
    max_experience = experience_for_next_level
    if max_experience > 0
      [(experience.to_f / max_experience) * 100, 100].min
    else
      0
    end
  end

  def experience_for_next_level
    base_experience = 100
    growth_rate = 0.10

    base_experience * ((1 + growth_rate) ** (level - 1)).to_i
  end

  def experience_to_next_level
    max_experience = experience_for_next_level
    [max_experience - experience, 0].max
  end

  def add_experience(points)
    self.experience += points
    while self.experience >= experience_for_next_level
      level_up
    end
    save
  end

  def level_up
    #increment!(:level, 1)
    self.experience = 0
    save
  end

  def experience
    super || 0
  end

  def level
    self[:level] || 1
  end

  def update_user_stats(task)
    rewards = task.category_rewards
    rewards.each do |reward|
      stat = reward.sub('+1 ', '')

      case stat
      when 'STR'
        self.str += 1
      when 'INT'
        self.int += 1
      when 'MANA'
        self.mana += 1
      when 'DEX'
        self.dex += 1
      when 'CHA'
        self.cha += 1
      end
    end
  end

end
