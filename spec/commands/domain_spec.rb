require 'rails_helper'

RSpec.describe Domain do

  describe "#lookup" do

    it "returns the correct command for the given key" do
      expected_command_class = Books::CreateBookCommand
      domain = Domain.instance
      actual_command_class = domain.lookup(:create_book)
      expect(actual_command_class).to eql(expected_command_class)
    end

  end

end
