require "rails_helper"
RSpec.describe Sample, :type => :model do
  context "Testing the model to parse hash" do
    let (:model) {Sample.new({"this" => [1,2,3,4,5,6], "that" => ['here', 'there', 'everywhere'], :other => 'here'})}

    it "Should initalize Sample" do
      expect(model).to be_a(Sample)
    end

    it "Should respond to normal key from hash" do
      expect(model).to respond_to('this')
      expect(model).to respond_to('that')
    end

    it "Should respond to normal key from symbol" do
      expect(model).to respond_to('other')
    end
  end
end
