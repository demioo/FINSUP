class Review < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :request

  validates :request_id, uniqueness: true
  validates :rating, :content, :client, :request_id, presence: true
end
