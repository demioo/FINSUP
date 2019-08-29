class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard_advisor?
    accept_advisor
  end

  def unanswered?
    accept_advisor
  end

  def new?
    reject_advisors
  end

  def specialty?
    reject_advisors
  end

  def content?
    reject_advisors
  end

  def set_content?
    reject_advisors
  end

  def create?
    record.client == user
  end

  private

  def accept_advisor
    record[0].advisor == user
  end

  def reject_advisors
    user.role != 'advisor'
  end
end
