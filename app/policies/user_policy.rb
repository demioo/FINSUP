class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def advisors?
    true
  end

  def show_advisor?
    true
  end
end
