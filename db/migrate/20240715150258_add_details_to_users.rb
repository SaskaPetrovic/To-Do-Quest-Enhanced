class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :roles, :string
    add_column :users, :experience, :integer
    add_column :users, :level, :integer
  end
end
