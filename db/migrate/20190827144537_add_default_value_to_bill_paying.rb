class AddDefaultValueToBillPaying < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :bill_paying, :boolean, default: false
  end
end
