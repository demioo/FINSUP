class UsersController < ApplicationController
  before_action :authorisations, except: [:edit, :update]
  skip_before_action :authenticate_user!, except: [:edit, :update]

  def advisors
    @advisors = policy_scope(User).where(role: 'advisor')
                                  .where.not(photo: nil)
                                  .where.not(response_time: nil)
                                  .where.not(bio: nil)

    specialty = session[:request]['specialty'] unless session[:request].nil? || session[:request]['specialty'].nil?

    if specialty == 'bill paying'
      @advisors = @advisors.select do |advisor|
        advisor.send('bill_paying')
      end
    elsif specialty
      @advisors = @advisors.select do |advisor|
        advisor.send(specialty)
      end
    else
      @advisors = @advisors.select do |advisor|
        advisor.saving || advisor.budgeting || advisor.bill_paying
      end
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

    average_rating
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

  def average_rating
    sum = 0
    @average = 0
    @advisor.reviews.each do |review|
      sum += review.rating
      occurrences = @advisor.reviews.count
      @average = sum.to_f / occurrences
    end
  end
end
