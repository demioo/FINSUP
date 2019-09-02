class ReviewsController < ApplicationController
  def create
    @advisor = User.find(params[:user_id])
    @review  = Review.new(review_params)
    @review.client = current_user
    @r_id = params[:review][:request_id]
    @review_check = Request.select { |r| r.client_id == current_user && r.advisor_id == @advisor }.count.zero?
    @all_reviews = @advisor.reviews
    authorize @review

    if @review.save
      respond_to do |format|
        format.html { redirect_to show_advisor_user_path(@advisor, r_id: params[:review][:request_id]) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'users/show_advisor' }
        format.js # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :request_id)
  end
end
