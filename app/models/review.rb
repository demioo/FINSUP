class Review < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :request
end
