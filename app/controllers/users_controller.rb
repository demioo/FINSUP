class UsersController < ApplicationController
  before_action :authorisations, except: [:edit, :update]
  skip_before_action :authenticate_user!, except: [:edit, :update]

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

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update(user_params)
      redirect_to dashboard_advisor_requests_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :response_time, :photo, :budgeting, :saving, :bill_paying)
  end

  def authorisations
    current_user.nil? ? skip_authorization : authorize_pundit
  end

  def authorize_pundit
    authorize User.new
  end
end
