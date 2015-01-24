class BookRepository
  include Storage::Repository

  def initialize(db = Book)
    super
  end

end
