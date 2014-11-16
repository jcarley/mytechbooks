require 'rails_helper'

RSpec.describe Services::AmazonSimpleSearch do

  xit "retrieves results from Amazon" do
    amz = Services::AmazonSimpleSearch.new
    items = amz.search("9780321200686")
    puts items.first
    expect(items).to_not be_empty
  end

end


