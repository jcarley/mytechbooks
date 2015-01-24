class AllBooksQuery
  include Storage::QueryObject

  def initialize(repository = BookRepository.new)
    super
  end

end
