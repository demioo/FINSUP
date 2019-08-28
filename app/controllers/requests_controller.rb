class RequestsController < ApplicationController
  before_action :find_request, only: %i[show edit update middle_update last_step destroy continue_request]
  def index
    @requests = policy_scope(Request)
  end

  def new
    @request = Request.new
    authorize @request
  end

  def create
    @request = Request.new(request_params)
    @request.client = current_user
    authorize @request
    if @request.save
      redirect_to continue_request_path(@request)
    else
      render :new
    end
  end

  def continue_request
  end

  def middle_update
    if @request.update(request_params)
      redirect_to last_step_path(@request)
    else
      render :continue_request
    end
  end

  def last_step
    @advisors = User.where(role: "advisor") # specialty: session[:specialty]
    # if !@request.update(request_params)
    #   render :continue_request
    # end
  end

  def show
  end

  def edit
  end

  def update
    if @request.update(request_params)
      redirect_to requests_path
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path
  end

  private

  def find_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:specialty, :content, :client, :advisor_id)
  end
end
