class RequestsController < ApplicationController
  before_action :authorize_pundit, only: %i[specialty content set_content]
  skip_before_action :authenticate_user!, except: %i[index dashboard_advisor unanswered create]

  def index
    @requests = policy_scope(Request).where(client: current_user)
  end

  def dashboard_advisor
    @requests = policy_scope(Request).where(advisor: current_user)
    authorize @requests
  end

  def unanswered
    @requests = policy_scope(Request).where(advisor: current_user)
    authorize @requests
  end

  def new
    authorize_pundit if current_user.nil?
    session[:request] = {}
  end

  def specialty
    session[:request][:specialty] = params[:specialty][:specialty]
    redirect_to content_requests_path
  end

  def content
  end

  def set_content
    session[:request][:content] = params[:content][:content]
    redirect_to advisors_users_path
  end

  def create
    session[:request][:advisor_id] = params[:request][:advisor_id]
    @request = Request.new(session[:request])
    @request.client = current_user
    authorize @request
    if @request.save
      redirect_to requests_path
    elsif @request.errors.messages.dig(:advisor)
      flash[:alert] = "Please select an advisor"
      redirect_to advisors_users_path
    elsif @request.errors.messages.dig(:content)
      flash[:alert] = "Please fill the content"
      redirect_to content_requests_path
    elsif @request.errors.messages.dig(:specialty)
      flash[:alert] = "Please choose a specialty"
      redirect_to new_request_path
    end
  end

  private

  def authorize_pundit
    authorize Request.new
  end
end
