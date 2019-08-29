class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :responses, :advisor_id, :sender_id
  end
end
