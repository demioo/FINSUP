class ResponsesController < ApplicationController
  def create
    skip_authorization
    @request = Request.find(params[:request_id])
    @responses = @request.responses
    if response_params[:content].blank?
      render "requests/chat"
    else
      @response = Response.new(response_params)
      @response.request = Request.find(params[:request_id])
      @response.sender = current_user
      flash[:alert] = "Please write a message then submit" unless @response.save

      Pusher.trigger('response-channel', 'new-response', response: @response.content, advisor: current_user.role == 'advisor', created_at: @response.created_at.strftime('%l:%M %p'))
    end
  end

  private

  def response_params
    params.require(:response).permit(:content)
  end
end
