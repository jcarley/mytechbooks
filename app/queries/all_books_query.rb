class AllBooksQuery
  include Enumerable

  def each(&block)
    Book.all.each(&block)
  end

end
