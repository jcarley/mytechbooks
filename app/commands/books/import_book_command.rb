module Books
  class ImportBookCommand < Command

    attr_accessor :title, :isbn, :author

    validates :title, presence: true, length: { maximum: 255 }
    validates :isbn, presence: true
    validates :author, presence: true

    def execute

    end

  end
end

