module Books
  class UpdateBookCommand < Command

    attr_accessor :id, :title, :isbn, :author, :ean, :pages, :binding, :edition,
      :formatted_price, :asin, :amount, :details_url, :description,
      :small_img_url, :medium_img_url, :large_img_url, :publisher, :published_on

    def initialize(id, params)
      super(params)
      @id = id
    end

    def execute
      book = Book.find(self.id)
      if book.update_attributes(self.to_params)
        @id = book.id
      end
    end

  end
end
