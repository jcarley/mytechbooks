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

    it "has a title" do
      expect(subject.title).to_not be_nil
    end

    it "has a isbn" do
      expect(subject.isbn).to_not be_nil
    end

  end

end
