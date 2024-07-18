class AddTaskIdToAchievements < ActiveRecord::Migration[7.1]
  def change
    add_reference :achievements, :task, null: false, foreign_key: true
  end
end
