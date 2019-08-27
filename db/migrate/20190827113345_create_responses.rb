class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :content
      t.references :request
      t.references :advisor

      t.timestamps
    end
  end

  add_foreign_key :responses, :users, column: :advisor_id, primary_key: :id
end
