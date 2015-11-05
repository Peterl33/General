require  "rails_helper"

RSpec.describe FileReader, :type => :model do

  let(:file_line){'f9d61e8c-5ffa-4387-b06b-b931406f0036	Happy Acres Daycare	2080 N Vassar Rd			Davison	MI'}
  let(:master_hash_ids){Hash.new(4)}
  let(:create_hash_keys_RESULT){FileReader.create_hash_keys(file_line.split)}
  let(:clean_data_up_and_split_RESULT){FileReader.clean_data_up_and_split(file_line)}
  let(:create_initial_data_array_RESULT){FileReader.create_initial_data_array(clean_data_up_and_split_RESULT,create_hash_keys_RESULT)}
  let(:compare_and_update_data_sets_RESULT){FileReader.compare_and_update_data_sets(create_initial_data_array_RESULT,clean_data_up_and_split_RESULT,master_hash_ids)}

  context 'testing File Reader Methods' do
    it 'should create a hash' do
      expect(FileReader.create_hash_keys(file_line.split)).to eq({"f9d61e8c-5ffa-4387-b06b-b931406f0036"=>"",
                                                                  "Happy"=>"",
                                                                  "Acres"=>"",
                                                                  "Daycare"=>"",
                                                                  "2080"=>"",
                                                                  "N"=>"",
                                                                  "Vassar"=>"",
                                                                  "Rd"=>"",
                                                                  "Davison"=>"",
                                                                  "MI"=>""})
    end

    it 'should clean_data_up_and_split' do
      expect(FileReader.clean_data_up_and_split(file_line)).to eq(["f9d61e8c-5ffa-4387-b06b-b931406f0036", "Happy Acres Daycare", "2080 N Vassar Rd", "", "", "Davison", "M"])
    end

    it 'should create_initial_data_array' do
      expect(FileReader.create_initial_data_array(clean_data_up_and_split_RESULT,create_hash_keys_RESULT)).to eq(["f9d61e8c-5ffa-4387-b06b-b931406f0036",
                                                                                                                  "Happy Acres Daycare",
                                                                                                                  "2080 N Vassar Rd",
                                                                                                                  "",
                                                                                                                  "",
                                                                                                                  "Davison",
                                                                                                                  "M",
                                                                                                                  "",
                                                                                                                  "",
                                                                                                                  ""])
    end
    it "should compare_and_update_data_sets" do
      expect(FileReader.compare_and_update_data_sets(create_initial_data_array_RESULT,clean_data_up_and_split_RESULT,master_hash_ids)).to eq( ["f9d61e8c-5ffa-4387-b06b-b931406f0036",
                                                                                                                                               "Happy Acres Daycare",
                                                                                                                                               "2080 N Vassar Rd",
                                                                                                                                               "",
                                                                                                                                               "",
                                                                                                                                               "Davison",
                                                                                                                                               "M",
                                                                                                                                                "",
                                                                                                                                                "",
                                                                                                                                                ""])
    end
    it "should transform_data_into_hash" do
      expect(FileReader.transform_data_into_hash(create_hash_keys_RESULT,compare_and_update_data_sets_RESULT,master_hash_ids)).to eq({"f9d61e8c-5ffa-4387-b06b-b931406f0036"=>[36, "f9d61e8c-5ffa-4387-b06b-b931406f0036"],
                                                                                                                                      "Happy"=>[19, "f9d61e8c-5ffa-4387-b06b-b931406f0036"],
                                                                                                                                      "Acres"=>[16, "f9d61e8c-5ffa-4387-b06b-b931406f0036"],
                                                                                                                                      "Daycare"=>[0, ""],
                                                                                                                                      "2080"=>[0, ""],
                                                                                                                                      "N"=>[7, "f9d61e8c-5ffa-4387-b06b-b931406f0036"],
                                                                                                                                      "Vassar"=>[1, "f9d61e8c-5ffa-4387-b06b-b931406f0036"],
                                                                                                                                      "Rd"=>[0, ""],
                                                                                                                                      "Davison"=>[0, ""],
                                                                                                                                      "MI"=>[0, ""]})
    end
  end
end