module Books
  class DeleteBookCommand < Command

    attr_accessor :id

    def initialize(id)
      super(:id => id)
    end

    def execute
      result = Book.destroy(self.id)
    end

  end

end

