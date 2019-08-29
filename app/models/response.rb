class Response < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :request

  validates :content, :request_id, :sender, presence: true
end
