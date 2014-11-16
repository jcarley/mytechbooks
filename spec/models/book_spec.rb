require 'rails_helper'

RSpec.describe Book, type: :model do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:isbn) }

  describe ".from_amz_item" do

    before(:all) do
      amz = Services::AmazonSimpleSearch.new
      items = amz.search("9780321200686")
      @book_item = items.first
    end

    let(:item) { @book_item }

    subject { Book.from_amz_item(item) }

    it "returns an instace of Book" do
      expect(subject).to be_a_new Book
    end

    context "has all its attributes" do
      %w(title author ean isbn pages binding edition formatted_price asin amount details_url description small_img_url medium_img_url large_img_url publisher published_on).each do |attr|
        it "has a #{attr}" do
          expect(subject.attributes[attr]).to_not be_nil
        end
      end
    end

  end

end
