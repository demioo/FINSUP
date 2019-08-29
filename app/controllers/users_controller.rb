class UsersController < ApplicationController
  before_action :authorize_pundit, only: %i[advisors show_advisor]

  def advisors
    @advisors = policy_scope(User).where(role: 'advisor')
  end

  def show_advisor
    @request = Request.new
    @advisor = User.find(params[:id])
  end

  private

  def authorize_pundit
    authorize User.new
  end
end
