class BookMapper

  def attributes_for(item)
    {
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
  end

  def coerce(value)
    value = value.is_a?(Array) ? value.join(", ") : value
    truncate(value)
  end

  def truncate(value)
    value.truncate(255)
  end

end

