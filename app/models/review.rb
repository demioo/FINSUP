class Review < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :request
  validates :request_id, uniqueness: true
end
