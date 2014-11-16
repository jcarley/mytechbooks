class Book < ActiveRecord::Base

  validates :title, presence: true
  validates :isbn, presence: true

  def self.from_amz_item(item)

    attrs = {
      title: item.title,
      isbn: item.isbn,
      author: item.author,
      ean: item.ean,
      pages: item.page_count,
      binding: item.binding,
      edition: item.edition,
      formatted_price: item.formatted_price,
      asin: item.asin,
      amount: item.amount,
      details_url: item.details_url,
      description: item.editorial_reviews!.editorial_review!.content,
      small_img_url: item.small_image.url,
      medium_img_url: item.medium_image.url,
      large_img_url: item.image_url,
      publisher: item.publisher,
      published_on: item.publication_date
    }

    Book.new(attrs)
  end

end

