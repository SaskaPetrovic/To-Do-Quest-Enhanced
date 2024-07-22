class AddStatsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :str, :integer, default: 0
    add_column :users, :int, :integer, default: 0
    add_column :users, :mana, :integer, default: 0
    add_column :users, :dex, :integer, default: 0
    add_column :users, :cha, :integer, default: 0
  end
end
