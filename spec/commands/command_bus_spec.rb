require 'rails_helper'

RSpec.describe CommandBus do

  describe "#lookup" do

    it "returns the correct command for the given key" do
      expected_command_class = Books::CreateBookCommand
      command_bus = CommandBus.new
      actual_command_class = command_bus.lookup(:create_book)
      expect(actual_command_class).to eql(expected_command_class)
    end

  end

end
