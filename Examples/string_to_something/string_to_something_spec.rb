require "rails_helper"

RSpec.describe StringToSomething, :type => :model do

  let (:model) {StringToSomething.new('{key:[[value_1, value_2],[value_3, value4]], 5:10:00AM]}')}

  context ".. initalizing an StringToSomething Obj" do
    it 'should initialize StringToSomething Object' do
      expect(model).to be_a(StringToSomething)
    end

    it 'should initialize StringToSomething with result accessor ' do
      expect(model).to respond_to(:results)
    end
  end


  context ".. testing methods" do
    it '#filter_string' do
      expect(model.filter_string).to eq('key:[[value_1, value_2],[value_3, value4]], 5:10:00AM]')
    end
    it '#find_potential_keys' do
      model.hash = 'key:[[value_1, value_2],[value_3, value4]], 5:10:00AM]'
      expect(model.find_potential_keys).to eq(["key:[[value_1, value_2],[value_3, value4]],", "5", "10:00AM]"])
    end
    it '#split_keys' do
      model.hash = ["key:[[value_1, value_2],[value_3, value4]],", "5", "10:00AM]"]
      expect(model.split_keys).to eq(["key:[[value_1, value_2],[value_3, value4]],", "5", "10:00AM]"])
    end
    it '#prepare_hash_from_string' do
      model.results = ([["key", "[[value_1, value_2],[value_3, value4]],"], ["5"], "10:00AM]"])
      expect(model.prepare_hash_from_string).to eq(["key", "[[value_1, value_2],[value_3, value4]],", "5", "10:00AM]"])
    end
    it '#clean_up_and_create_hash' do
      model.results = ["key", "[[value_1, value_2],[value_3, value4]],", "5", "10:00AM]"]
      expect(model.clean_up_and_create_hash).to eq({"key"=>"[[value_1, value_2],[value_3, value4]]", "5"=>"10:00AM"})
    end
    it '#return_hash' do
      model.results = {"key"=>"[[value_1, value_2],[value_3, value4]]", "5"=>"10:00AM"}
      expect(model.return_hash).to eq({"key"=>"[[value_1, value_2],[value_3, value4]]", "5"=>"10:00AM"})
    end
    it '#return_hash_to_json' do
      model.results = {"key"=>"[[value_1, value_2],[value_3, value4]]", "5"=>"10:00AM"}
      expect(model.return_hash_to_json).to eq("{\"key\":\"[[value_1, value_2],[value_3, value4]]\",\"5\":\"10:00AM\"}")
    end
  end
``` `
end