class AddMemoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :memo, :text
  end
end
