module Books
  class CreateBookCommand < Command

    attr_reader :id

    attr_accessor :title, :isbn, :author, :ean, :pages, :binding, :edition,
      :formatted_price, :asin, :amount, :details_url, :description,
      :small_img_url, :medium_img_url, :large_img_url, :publisher, :published_on

    validates :title, presence: true, length: { maximum: 255 }
    validates :isbn, presence: true

    def execute
      book = Book.create_book(self.to_params)
      @id = book.id if book
    end
  end
end
