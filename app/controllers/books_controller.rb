class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    command = Domain.execute(:create_book, params[:book])

    if command.success?
      redirect_to book_url(command.id)
    else
      @book = Book.new(command.to_params)
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    command = Domain.execute(:update_book, params[:id], params[:book])

    if command.success?
      redirect_to book_url(command.id)
    else
      @book = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    command = Domain.execute(:delete_book, params.permit(:id))

    if command.success?
      redirect_to action: :show
    else
      render :edit
    end
  end

end
