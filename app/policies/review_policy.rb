class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # true unless Booking.all.select { |b| b.renter_id == user }.count.zero?
    true
  end
end
