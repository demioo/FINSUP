class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @request = Request.find(params[:request])
    authorize @user
  end
end
