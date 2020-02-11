class BooksController < ApplicationController
  def index
      @book = Book.new
      @books = Book.all

  end

  def show
      @book = Book.find(params[:id])

  end

  def new

  end

  def create
      @book = Book.new(book_params)
      @books = Book.all
      if @book.save
        flash[:notice2] = "Book was successfully created."
        redirect_to book_path(@book.id)
      else
        render action: :index
      end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      book = Book.find(params[:id])
      if book.update(book_params)
        flash[:notice3] = "Book was successfully updated"
        redirect_to book_path(book)
      else
        render action: :created
      end
  end

  def destroy
      book = Book.find(params[:id])

      if book.destroy
        flash[:notice] = "Book was successfully destroyed."
        redirect_to books_path
      else
        render action: :create
      end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
