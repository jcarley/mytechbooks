require 'asin/adapter'

module Services
  class AmazonSimpleSearch
    include ASIN::Client
    include ASIN::Adapter

    def search(isbn)
      items = search_keywords(isbn, {:SearchIndex => :Books, :ResponseGroup => :Medium})
      if block_given?
        items = [] if items.nil?
        items.each do |item|
          yield item
        end
      else
        items
      end
    end

  end
end
