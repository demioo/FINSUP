class Response < ApplicationRecord
  belongs_to :advisor, class_name: 'User'
  belongs_to :request

  validates :content, :request_id, :advisor, presence: true
end
