require 'asin/adapter'

module Services
  class AmazonSimpleSearch
    include ASIN::Client
    include ASIN::Adapter

    def query(isbn)
      isbn.strip!
      params = {:Keywords => isbn}
      params.merge!({:SearchIndex => :Books, :ResponseGroup => :Medium})
      items = search(params)
      if block_given?
        items = [] if items.nil?
        items.each do |item|
          yield item
        end
      else
        items
      end
    end

    def query_keywords(*keywords)
      keywords.each(&:strip!)
      items = search_keywords(*keywords, {:SearchIndex => :Books, :ResponseGroup => :Medium})
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
