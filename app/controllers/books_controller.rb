class BooksController < ApplicationController

  def show
    @book = Book.find(id_params)
  end

  def new
    @book = Book.new
  end

  def create
    cmd = Books::CreateBookCommand.new(book_params)
    if Domain.execute(cmd).is_successful?
      redirect_to book_url(cmd.id)
    else
      @book = Book.new(cmd.to_params)
      render :new
    end
  end

  def edit
    @book = Book.find(id_params)
  end

  def update
    cmd = Books::UpdateBookCommand.new(id_params, book_params)
    if Domain.execute(cmd).is_successful?
      redirect_to book_url(cmd.id)
    else
      @book = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    cmd = Books::DeleteBookCommand.new(id_params)
    if Domain.execute(cmd).is_successful?
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book)
  end

  def id_params
    params.require(:id)
  end

end
