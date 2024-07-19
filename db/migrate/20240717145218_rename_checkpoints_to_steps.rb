class RenameCheckpointsToSteps < ActiveRecord::Migration[7.1]
  def change
    rename_table :checkpoints, :steps
  end
end
