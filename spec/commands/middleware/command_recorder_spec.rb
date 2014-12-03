require 'rails_helper'

RSpec.describe Middlware::CommandRecorder do

  describe "#call" do

    let(:params) { {:title => "Sleepy Hollow", :isbn => "1234567890"} }

    it "creates a command source record" do
      recorder = Middlware::CommandRecorder.new(nil)
      cmd = Books::CreateBookCommand.new(params)
      expect { recorder.call(:command => cmd) }.to change(CommandSource, :count).by(1)
    end

  end

end
