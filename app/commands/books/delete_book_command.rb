module Books
  class DeleteBookCommand < Command

    attr_accessor :id

    def execute
      result = Book.destroy(self.id)
      @success = result.destroyed?
    rescue ActiveRecord::RecordNotFound => e
      @success = false
    end

    def success?
      @success
    end

  end

end

