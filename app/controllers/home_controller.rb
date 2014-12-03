class HomeController < ApplicationController

  def index
    query = AllBooksQuery.new
    @books = query.to_a
  end

end
