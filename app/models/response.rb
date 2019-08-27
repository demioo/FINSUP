class Response < ApplicationRecord
  belongs_to :advisor, class_name: 'User'
  belongs_to :request
end
