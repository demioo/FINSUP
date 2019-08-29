class AddColumnsToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :monthly_income, :integer
    add_column :requests, :fixed_expenses, :text
    add_column :requests, :household_size, :integer
    add_column :requests, :paycheck_frequency, :string
    add_column :requests, :savings_goal, :text
    add_column :requests, :due_dates, :text
    add_column :requests, :bank_account, :string
  end
end
