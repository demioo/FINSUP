class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string
    add_column :users, :response_time, :integer
    add_column :users, :role, :string
    add_column :users, :monthly_income, :integer
    add_column :users, :bio, :text
  end
end
