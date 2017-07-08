class Admin::BooksController < AdminController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]
  before_action :set_book, only: [:activate, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  def activate
    if @book.active
      @book.update(active: false)
      message = "#{@book.name} inactivated"
    else
      @book.update(active: true)
      message = "#{@book.name} activated"
    end
    redirect_to admin_books_path, notice: message
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to admin_books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
end
