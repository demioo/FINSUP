class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :type
      t.text :content
      t.references :client
      t.references :advisor

      t.timestamps
    end
    add_foreign_key :requests, :users, column: :client_id, primary_key: :id
    add_foreign_key :requests, :users, column: :advisor_id, primary_key: :id
  end
end
