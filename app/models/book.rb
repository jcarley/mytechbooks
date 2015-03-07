class Book < ActiveRecord::Base
  include Entity

  validates :title, presence: true
  validates :isbn, presence: true

  def self.create_from_amz_item(item)
    mapper = BookMapper.new
    attrs = mapper.attributes_for(item)
    self.create_book(attrs)
  end

  def self.create_book(params)
    book = Book.create(params)
    book.apply_event(:created_book, params.merge(:uid => new_uid))
    book
  end

  def self.delete_book(id)
    book = Book.find_by(:id => id)
    book.delete_book(id)
  end

  def delete_book(id)
    apply_event(:deleted_book, id)
    self
  end

  def formatted_published_on
    if published_on
      published_on.strftime("%b %Y")
    else
      "not available"
    end
  end

  private

  def on_created_book(event)
    self.assign_attributes(event.data)
  end

end

