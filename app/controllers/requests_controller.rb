class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:index, :create]
  def index
    @requests = policy_scope(Request)
  end

  def new
    skip_authorization
    session[:request] = {} unless !session[:request]['content'].nil? || !session[:request]['advisor_id'].nil?
  end

  def specialty
    skip_authorization
    session[:request][:specialty] = params[:specialty][:specialty]
    specialty_test
  end

  def content
    skip_authorization
  end

  def set_content
    skip_authorization
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

  def request_params
    params.require(:request).permit(:specialty, :content, :client, :advisor_id)
  end
end
