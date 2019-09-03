class UsersController < ApplicationController
  before_action :authorisations
  skip_before_action :authenticate_user!

  def advisors
    @advisors = policy_scope(User).where(role: 'advisor')
                                  .where.not(photo: nil)
                                  .where.not(response_time: nil)
                                  .where.not(bio: nil)
    @advisors = @advisors.select do |advisor|
      advisor.saving || advisor.budgeting || advisor.bill_paying
    end
  end

  def show_advisor
    if params[:r_id]
      @request = Request.find(params[:r_id])
    else
      @request = Request.new
    end
    @advisor = User.find(params[:id])
    @review = Review.new
    # raise
  end

  private

  def authorisations
    current_user.nil? ? skip_authorization : authorize_pundit
  end

  def authorize_pundit
    authorize User.new
  end
end
