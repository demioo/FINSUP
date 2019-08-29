class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @request = Request.find(params[:request])
    authorize @user
  end

  def advisors

    @advisors = policy_scope(User).where(role: 'advisor')
    authorize @advisors
  end

  def show_advisor
    @request = Request.new
    @advisor = User.find(params[:id])
    authorize @advisor
  end
end
