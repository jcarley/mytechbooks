require 'rails_helper'

RSpec.describe CommandSource, :type => :model do

  describe "public methods" do
    it { is_expected.to respond_to(:user_id) }
    it { is_expected.to respond_to(:class_type) }
    it { is_expected.to respond_to(:body) }
  end

  describe "#user_id" do
    it "is required to be set" do
      model = FactoryGirl.build(:command_source, :user_id => nil)
      expect(model).to_not be_valid
    end
  end

  describe "#body" do
    it "is required to be set" do
      model = FactoryGirl.build(:command_source, :body => nil)
      expect(model).to_not be_valid
    end
  end

  describe "#class_type" do
    it "is required to be set" do
      model = FactoryGirl.build(:command_source, :class_type => nil)
      expect(model).to_not be_valid
    end
  end

end
