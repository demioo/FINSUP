class AddSpecialtiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :budgeting, :boolean
    add_column :users, :saving, :boolean
    add_column :users, :bill_paying, :boolean
  end
end
