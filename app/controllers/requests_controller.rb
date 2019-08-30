class RequestsController < ApplicationController
  before_action :authorisations, only: %i[new specialty content set_content]
  skip_before_action :authenticate_user!, except: %i[index dashboard_advisor unanswered create]

  def index
    @requests = policy_scope(Request).where(client: current_user)
  end

  def dashboard_advisor
    @requests = policy_scope(Request)
    authorize @requests
    @requests = policy_scope(Request).where(advisor: current_user)
  end

  def unanswered
    @requests = policy_scope(Request)
    authorize @requests
    @requests = policy_scope(Request).where(advisor: current_user)
  end

  def new
    skip_authorization
    session[:request] = {}
  end

  def specialty
    session[:request][:specialty] = params[:specialty][:specialty]
    specialty_test
  end

  def content
  end

  def set_content
    session[:request][:content] = params[:content][:content]
    set_content_test
  end

  def create
    session[:request][:advisor_id] = params[:request][:advisor_id] unless params[:request].nil?
    @request = Request.new(session[:request])
    @request.client = current_user
    authorize @request
    error_check
  end

  private

  def check_after_specialty
    if session[:request]['content'].nil?
      redirect_to content_requests_path
    elsif !session[:request]['content'].empty? && !session[:request]['advisor_id'].nil?
      redirect_to completed_requests_path
    elsif session[:request]['content'].empty?
      redirect_to content_requests_path
    elsif session[:request]['advisor_id'].nil?
      redirect_to set_content_requests_path
    end
  end

  def specialty_test
    if session[:request]['content'].nil? && session[:request]['advisor_id'].nil?
      redirect_to content_requests_path
    else
      check_after_specialty
    end
  end

  def set_content_test
    if !session[:request]['advisor_id'].nil?
      redirect_to completed_requests_path
    else
      redirect_to advisors_users_path
    end
  end

  def error_check
    if @request.save
      redirect_to requests_path
      session[:request] = {}
    elsif @request.specialty.nil?
      flash[:alert] = "Please choose a specialty"
      redirect_to new_request_path
    elsif @request.content.nil? || @request.content.empty?
      flash[:alert] = "Please fill the content"
      redirect_to content_requests_path
    elsif @request.advisor.nil?
      flash[:alert] = "Please choose an advisor"
      redirect_to advisors_users_path
    end
  end

  def authorisations
    current_user.nil? ? skip_authorization : authorize_pundit
  end

  def authorize_pundit
    authorize Request.new
  end
end
