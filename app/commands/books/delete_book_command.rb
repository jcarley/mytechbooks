module Books
  class DeleteBookCommand < Command

    attribute :id, Integer

    def initialize(id)
      super(:id => id)
    end

    def execute
      book = Book.delete_book(self.id)
      repository = BookRepository.new
      repository.delete(book)
    end

  end

end

