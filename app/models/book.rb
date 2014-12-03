class Book < ActiveRecord::Base

  validates :title, presence: true
  validates :isbn, presence: true

  def self.from_amz_item(item)

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

    Book.new(attrs)
  end

  def self.coerce(value)
    value = value.is_a?(Array) ? value.join(", ") : value
    truncate(value)
  end

  def self.truncate(value)
    if value.is_a?(String) && value.length > 255
      value[0..250] + " ..."
    else
      value
    end
  end

  def formatted_published_on
    if published_on
      published_on.strftime("%b %Y")
    else
      "not available"
    end
  end

end

