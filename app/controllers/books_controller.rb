class BooksController < ApplicationController
  def index
    books = Book.all
    render json: books, status: :ok
  end

  def show
    book = Book.find(params[:id])
    render json: book, status: :ok
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: :created
    else
      render json: book.error, status: :unprocessable_entity
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      render json: book, status: :ok
    else
      render json: book.error, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      render json: { message: "Successfully deleted" }, status: :ok
    else
      render json: book.error, status: :unprocessable_entity
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :ISBN, :genre)
  end
end
