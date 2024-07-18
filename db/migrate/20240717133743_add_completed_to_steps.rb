class AddCompletedToSteps < ActiveRecord::Migration[7.1]
  def change
    add_column :steps, :completed, :boolean
  end
end
