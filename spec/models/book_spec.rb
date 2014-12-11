require 'rails_helper'

RSpec.describe Book, type: :model do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:isbn) }

  describe ".create_from_amz_item" do

    before(:all) do
      # amz = Services::AmazonSimpleSearch.new
      # items = amz.query("9780321200686")
      # File.open("test.txt", "w+") do |f|
        # f.puts(items.first.to_json)
      # end
      # @book_item = items.first
      binding.pry
      json = File.readlines("spec/support/book.json").join
      @book_item = ActiveSupport::JSON.decode(json)
      puts "hello"
    end

    let(:item) { @book_item }

    subject { Book.create_from_amz_item(item) }

    it "returns an instace of Book" do
      expect(subject).to be_an_instance_of Book
    end

    context "has all its attributes" do
      %w(title author ean isbn pages binding edition formatted_price asin amount details_url description small_img_url medium_img_url large_img_url publisher published_on).each do |attr|
        it "has a #{attr}" do
          expect(subject.attributes[attr]).to_not be_nil
        end
      end
    end

  end

  describe ".create_book" do

    it "creates a new book" do
      attrs = FactoryGirl.attributes_for(:book)
      expect { Book.create_book(attrs) }.to change(Book, :count).by(1)
    end

    it "adds a new uid" do
      attrs = FactoryGirl.attributes_for(:book)
      book = Book.create_book(attrs)
      expect(book.uid).to_not be_nil
    end

    it "adds a new event to applied events" do
      attrs = FactoryGirl.attributes_for(:book)
      book = Book.create_book(attrs)
      expect(book.applied_events.count).to be(1)
    end

    it "creates a new event record" do
      attrs = FactoryGirl.attributes_for(:book)
      expect { Book.create_book(attrs) }.to change(Event, :count).by(1)
    end

  end

end
