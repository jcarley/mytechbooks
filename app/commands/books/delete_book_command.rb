module Books
  class DeleteBookCommand < Command

    attribute :id, Integer

    def initialize(id)
      super(:id => id)
    end

    def execute
      result = Book.destroy(self.id)
    end

  end

end

