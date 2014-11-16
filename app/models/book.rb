class Book < ActiveRecord::Base

  validates :title, presence: true
  validates :isbn, presence: true

  def self.from_amz_item(item)

    # binding.pry

    attrs = {
      title: item.title,
      isbn: nil
    }

    Book.new(attrs)
  end

end

# t.string   "title"
# t.string   "author"
# t.string   "ean"
# t.string   "isbn"
# t.integer  "pages"
# t.string   "binding"
# t.integer  "edition"
# t.string   "formatted_price"
# t.string   "asin"
# t.string   "amount"
# t.string   "details_url"
# t.string   "description"
# t.string   "small_img_url"
# t.string   "medium_img_url"
# t.string   "large_img_url"
# t.string   "publisher"
# t.date     "published_on"
