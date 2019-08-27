class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_requests, class_name: 'Request', foreign_key: 'client_id'
  has_many :received_requests, class_name: 'Request', foreign_key: 'advisor_id'
  has_many :sent_responses, class_name: 'Response', foreign_key: 'advisor_id'

  ROLES = %w[client advisor]

  # validates :first_name, :last_name, :role, presence: true
  # validates :role, inclusion: { in: ROLES }
  # validates :bio, :response_time, :avatar, presence: true, if: -> { role == 'advisor' }
  # validates :monthly_income, presence: true, if: -> { role == 'client' }
  # validate :must_have_a_specialty, if: -> { role == 'advisor' }

  def must_have_a_specialty
    unless budgeting || saving || bill_paying
      errors.add(:id, "An advisor must have at least one specialty")
    end
  end

  def received_reviews
    received_requests.map(&:review)
    # Review.joins(:request).where(requests: { advisor_id: id })
  end
end
