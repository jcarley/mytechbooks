require 'rails_helper'

RSpec.describe Books::DeleteBookCommand do

  describe "public methods" do
    subject { Books::DeleteBookCommand.new(1) }
    it { is_expected.to respond_to(:id) }
  end

  describe "#execute" do
    subject { Books::DeleteBookCommand.new(book.id) }

    let!(:book) { FactoryGirl.create(:book) }

    it "deletes a book" do
      expect { subject.execute }.to change(Book, :count).by(-1)
    end

    it "records a delete event" do
      expect { subject.execute }.to change(Event, :count).by(1)
    end
  end

end
