require 'rails_helper'

RSpec.describe Books::UpdateBookCommand do

  describe "#execute" do

    let(:book) { FactoryGirl.create(:book) }
    let(:attrs) { {:title => "Sleepy Hollow"} }

    it "updates a book" do
      cmd = Books::UpdateBookCommand.new(book.id, attrs)
      cmd.execute
      db_book = Book.find(book.id)
      expect(db_book.title).to eql(attrs[:title])
    end

  end

end
