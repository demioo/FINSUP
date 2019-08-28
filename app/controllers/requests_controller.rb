class RequestsController < ApplicationController
  def index
    @requests = policy_scope(Request)
  end

  def new
    skip_authorization
    session[:request] = {}
  end

  def specialty
    skip_authorization
    session[:request][:specialty] = params[:specialty][:specialty]
    redirect_to content_requests_path
  end

  def content
    skip_authorization
  end

  def set_content
    skip_authorization
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
    end
    # raise
  end

  private

  def request_params
    params.require(:request).permit(:specialty, :content, :client, :advisor_id)
  end
end
