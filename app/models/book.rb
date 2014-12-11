class Book < ActiveRecord::Base
  include Entity

  validates :title, presence: true
  validates :isbn, presence: true

  def self.create_book(params)
    book = Book.new
    book.apply_event(:created_book, params.merge(:uid => new_uid))
    book
  end

  def self.create_from_amz_item(item)
    mapper = BookMapper.new
    attrs = mapper.attributes_for(item)
    self.create_book(attrs)
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
    self.save!
  end

end

