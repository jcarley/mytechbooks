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

    attrs = {
      title: coerce(item.title),
      isbn: item.isbn,
      author: coerce(item.author),
      ean: item.ean,
      pages: item.page_count,
      binding: item.binding,
      edition: item.edition,
      formatted_price: item.formatted_price,
      asin: item.asin,
      amount: item.amount,
      details_url: item.details_url,
      description: "",
      small_img_url: item.small_image.url,
      medium_img_url: item.medium_image.url,
      large_img_url: item.image_url,
      publisher: item.publisher,
      published_on: item.publication_date
    }

    self.create_book(attrs)
  end

  def self.coerce(value)
    value = value.is_a?(Array) ? value.join(", ") : value
    truncate(value)
  end

  def self.truncate(value)
    value.truncate(255)
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

