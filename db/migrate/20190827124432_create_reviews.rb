class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :client
      t.references :request

      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :client_id, primary_key: :id
  end
end
