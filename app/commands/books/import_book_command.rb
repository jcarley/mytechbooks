module Books
  class ImportBookCommand < Command

    attribute :title, String
    attribute :isbn, String
    attribute :author, String

    validates :title, presence: true, length: { maximum: 255 }
    validates :isbn, presence: true
    validates :author, presence: true

    def execute

    end

  end
end

