class Request < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :advisor, class_name: 'User'
end
