class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  before_action :reject_advisors

  def new?
  end

  def specialty?
  end

  def content?
  end

  def set_content?
  end

  def create?
    record.user == user
  end

  private

  def reject_advisors
    user.role != 'advisor'
  end
end
