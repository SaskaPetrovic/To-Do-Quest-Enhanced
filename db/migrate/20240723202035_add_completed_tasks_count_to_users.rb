class AddCompletedTasksCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :completed_tasks_count, :integer , default: 0
  end
end
