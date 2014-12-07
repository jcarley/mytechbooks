module Books
  class DeleteBookCommand < Command

    attr_accessor :id

    def initialize(id)
      super(:id => id)
    end

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

