class BooksController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_categories_authors, only: [:new, :edit, :update, :create]

  # GET /books
  # GET /books.json
  def index
    @books = Book.search(params[:search]).all.sort_by {|book| book.rate_count}.reverse
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = current_user.books.build
    @image = @book.images.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        params[:images]['attachment'].each do |a|
          @image = @book.images.create!(attachment: a, book_id: @book.id, user_id: current_user.id)
        end
        format.html { redirect_to @book, notice: 'Book was successfully created. It will be added after moderation!' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_categories_authors
      @categories = Category.all
      @authors = Author.all
    end
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :description, :cover, :terms, category_ids: [], author_ids: [], images_attributes: [:book_id, :attachment, :user_id, :id])
    end
end
