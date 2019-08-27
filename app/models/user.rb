class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_requests, class_name: 'Request', foreign_key: 'client_id'
  has_many :received_requests, class_name: 'Request', foreign_key: 'advisor_id'
  has_many :sent_responses, class_name: 'Response', foreign_key: 'advisor_id'
end
