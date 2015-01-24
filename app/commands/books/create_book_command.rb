module Books
  class CreateBookCommand < Command

    attribute   :id,                Integer
    attribute   :title,             String
    attribute   :isbn,              String
    attribute   :author,            String
    attribute   :ean,               String
    attribute   :pages,             Integer
    attribute   :binding,           String
    attribute   :edition,           Integer
    attribute   :formatted_price,   String
    attribute   :asin,              String
    attribute   :amount,            String
    attribute   :details_url,       String
    attribute   :description,       String
    attribute   :small_img_url,     String
    attribute   :medium_img_url,    String
    attribute   :large_img_url,     String
    attribute   :publisher,         String
    attribute   :published_on,      Date

    validates :title, presence: true, length: { maximum: 255 }
    validates :isbn, presence: true

    def execute
      parameters = self.to_params
      book = Book.create_book(self.to_params)
      repository = BookRepository.new
      repository.save(book)
      @id = book.id if book
    end
  end
end
