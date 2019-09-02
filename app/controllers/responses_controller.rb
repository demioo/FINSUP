class ResponsesController < ApplicationController
  def create
    skip_authorization
    @response = Response.new(response_params)
    @response.request = Request.find(params[:request_id])
    @response.sender = current_user
    flash[:alert] = "Please write a message then submit" unless @response.save
    redirect_to chat_request_path(@response.request)
  end

  private

  def response_params
    params.require(:response).permit(:content)
  end
end
