module Books
  class UpdateBookCommand < Command

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

    def initialize(id, attrs)
      super(attrs.merge(:id => id))
    end

    def execute
      book = Book.find(self.id)
      attrs = self.to_params
      book.update_attributes!(self.to_params)
      @id = book.id
    end

  end
end
