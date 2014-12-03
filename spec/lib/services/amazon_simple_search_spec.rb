require 'rails_helper'

RSpec.describe Services::AmazonSimpleSearch do

  it "retrieves results from Amazon" do
    amz = Services::AmazonSimpleSearch.new
    items = amz.query("9780321200686")
    expect(items).to_not be_empty
  end

end


