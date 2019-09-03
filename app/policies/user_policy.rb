class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def advisors?
    reject_advisors
  end

  def show_advisor?
    reject_advisors
  end

  def update?
    record == user
  end

  private

  def reject_advisors
    user.role != 'advisor'
  end
end
