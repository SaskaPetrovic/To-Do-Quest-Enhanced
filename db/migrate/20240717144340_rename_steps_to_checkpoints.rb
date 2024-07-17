class RenameStepsToCheckpoints < ActiveRecord::Migration[7.0]
  def change
    rename_table :steps, :checkpoints
  end
end
