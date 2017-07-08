class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book
  # POST /reviews
  # POST /reviews.json
  def create
    @review = @book.reviews.build(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to @book, notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @review = @book.reviews.find(params[:id])

    @review.destroy
    respond_to do |format|
      format.html { redirect_to @book, notice: 'Review was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:book_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rate, :body, :user_id, :book_id)
    end
end
