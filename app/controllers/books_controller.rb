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
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
      blog = Blog.find(params[:id])
      blog.update(blog_params)
      redirect_to blog_path(blog)
  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
