class Request < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :advisor, class_name: 'User'
  has_one :response, dependent: :destroy
  has_one :review, dependent: :destroy

  TYPES = ['budgeting', 'saving', 'bill paying']

  validates :client, :advisor, :content, :type, presence: true
  validates :type, inclusion: { in: TYPES }
end
