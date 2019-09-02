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

  def chat?
    record.client == user || record.advisor == user
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
    if record[0]
      record[0].advisor == user
    else
      true
    end
  end

  def reject_advisors
    user.role != 'advisor'
  end
end
