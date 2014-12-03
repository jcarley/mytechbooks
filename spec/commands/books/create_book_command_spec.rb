require 'rails_helper'

RSpec.describe Books::CreateBookCommand do

  describe "public methods" do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:isbn) }
    it { is_expected.to respond_to(:author) }
    it { is_expected.to respond_to(:ean) }
    it { is_expected.to respond_to(:pages) }
    it { is_expected.to respond_to(:binding) }
    it { is_expected.to respond_to(:edition) }
    it { is_expected.to respond_to(:formatted_price) }
    it { is_expected.to respond_to(:asin) }
    it { is_expected.to respond_to(:amount) }
    it { is_expected.to respond_to(:details_url) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:small_img_url) }
    it { is_expected.to respond_to(:medium_img_url) }
    it { is_expected.to respond_to(:large_img_url) }
    it { is_expected.to respond_to(:publisher) }
    it { is_expected.to respond_to(:published_on) }
    it { is_expected.to respond_to(:execute) }
  end

  describe "validations" do

    it "requires a title" do
      cmd = Books::CreateBookCommand.new(:isbn => "1234567890")
      expect(cmd).to_not be_valid
    end

    it "restricts a title to 255 characters" do
      title = "h" * 256
      cmd = Books::CreateBookCommand.new(:title => title, :isbn => "1234567890")
      expect(cmd).to_not be_valid
    end

    it "requires an isbn" do
      cmd = Books::CreateBookCommand.new(:title => "Sleepy Hollow")
      expect(cmd).to_not be_valid
    end

  end

  describe "#execute" do

    let(:params) { {:title => "Sleepy Hollow", :isbn => "1234567890"} }

    it "creates a book" do
      command_bus = CommandBus.new
      expect { command_bus.execute(:create_book, params) }.to change(Book, :count).by(1)
    end
  end

end
