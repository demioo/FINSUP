class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  before_action :reject_advisors, only: %i[advisors? show_advisor?]

  def advisors?
  end

  def show_advisor?
  end

  private

  def reject_advisors
    user.role != 'advisor'
  end
end
