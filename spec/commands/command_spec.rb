require 'rails_helper'

RSpec.describe Command do

  let(:json) {
    '{"title":"Sleepy Hollow", "isbn":"123456789", "author":"Chris Johnson"}'
  }

  describe ".from_json" do

    it "returns a command class given a json string" do
      expected_command_instance_type = Books::ImportBookCommand
      command = Books::ImportBookCommand.from_json(json)
      expect(command).to be_instance_of(expected_command_instance_type)
    end

    it "returns a populated command class given a json string" do
      expected_command_instance_type = Books::ImportBookCommand
      command = Books::ImportBookCommand.from_json(json)
      expect(command.title).to eql("Sleepy Hollow")
      expect(command.isbn).to eql("123456789")
      expect(command.author).to eql("Chris Johnson")
    end

  end

  describe "#as_json" do

    it "returns the command serialized as a json string" do
      command = Books::ImportBookCommand.from_json(json)
      json_string = command.as_json
      expect(json_string).to eql(JSON.load(json).deep_symbolize_keys)
    end

  end


end
