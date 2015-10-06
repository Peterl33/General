require 'rails_helper'

RSpec.describe Factor, :type => :model do

  context "initialized with string" do
    it 'should return error' do
      expect{Factor.new('123')}.to raise_error(RuntimeError)
    end
  end

  context "initialized with empty array" do
    it 'should return error' do
      expect{Factor.new([])}.to raise_error(RuntimeError)
    end
  end

  describe "Testing Normal Outputs for finding factors" do
    let(:factor) {Factor.new([10, 5, 2, 20])}
    context "testing the find_all_factors_in_array method" do
      it 'should return correct values' do
        factor.find_all_factors_in_array
        expect(factor.factors).to eq({10=>[2,5], 5=>[], 2=>[], 20=>[2,5,10]})
      end
    end

    context "testing the find_all_factors_in_array method" do
      let(:factor) {Factor.new([10, 5, 2, 20, 5, 121, 120])}
      it 'should return uniq correct values' do
        factor.find_all_factors_in_array
        expect(factor.factors).to eq({2=>[], 5=>[], 10=>[2, 5], 20=>[2, 5, 10], 120=>[2, 5, 10, 20], 121=>[]} )
      end
    end

  end

  describe "Testing Reverse Outputs for finding factors" do
    let(:factor) {Factor.new([10, 5, 2, 20])}
    context "testing the find_all_factors_in_array method" do
      it 'should return correct values' do
        factor.reverse = true
        factor.find_all_factors_in_array
        expect(factor.factors).to eq({10=>[20], 5=>[10, 20], 2=>[10, 20], 20=>[]})
      end
    end

    context "testing the find_all_factors_in_array method" do
      let(:factor) {Factor.new([10, 5, 2, 20, 5, 121, 120])}
      it 'should return uniq correct values' do
        factor.reverse = true
        factor.find_all_factors_in_array
        expect(factor.factors).to eq({2=>[10,20,120], 5=>[10, 20, 120], 10=>[20, 120], 20=>[120], 120=>[], 121=>[]} )
      end
    end

  end

end