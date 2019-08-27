class AddDefaultValueToSaving < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :saving, :boolean, default: false
  end
end
