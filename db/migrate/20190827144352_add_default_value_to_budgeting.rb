class AddDefaultValueToBudgeting < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :budgeting, :boolean, default: false
  end
end
