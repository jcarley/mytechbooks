require 'rails_helper'

RSpec.describe Middleware::CommandRecorder do

  describe "#call" do

    let(:params) { {:title => "Sleepy Hollow", :isbn => "1234567890"} }

    it "creates a command source record" do
      recorder = Middleware::CommandRecorder.new(nil)
      cmd = Books::CreateBookCommand.new(params)
      expect { recorder.call(:command => cmd) }.to change(CommandSource, :count).by(1)
    end

  end

end
