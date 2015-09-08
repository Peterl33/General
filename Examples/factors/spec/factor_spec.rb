require 'rails_helper'

RSpec.describe Factor, :type => :model do
    
    factor = Factor.new
    
    context "Testing Base Cases" do
        it 'should return no factors found []' do
            results = factor.find_all_factors_in_array([])
            expect(results).to eq('no factors found')
        end
        
        it 'should return array required message []' do
            results = factor.find_all_factors_in_array("random")
            expect(results).to eq("parameter must be an array! ")
        end
    end
    
    context "Testing Normal Output" do
        
        it 'should return correct hash [10, 5, 2, 20]' do
            results = factor.find_all_factors_in_array([10, 5, 2, 20])
            expect(results).to eq({10=>[5, 2], 5=>[], 2=>[], 20=>[10, 5, 2]})
        end
        
        it 'should return correct hash [2, 5, 10, 20]' do
            results = factor.find_all_factors_in_array([2, 5, 10, 20])
            expect(results).to eq({2=>[], 5=>[], 10=>[2,5], 20=>[2,5,10]})
        end
        
        it 'should return correct hash [20, 10, 5, 2]' do
            results = factor.find_all_factors_in_array([20, 10, 5, 2])
            expect(results).to eq({20=>[10,5,2], 10=>[5,2], 5=>[], 2=>[]})
        end
        
        it 'should return correct hash without duplicates [10, 5, 2, 20, 5, 121, 120]]' do
            results = factor.find_all_factors_in_array([10, 5, 2, 20, 5, 121, 120])
            expect(results).to eq({10=>[5, 2], 5=>[], 2=>[], 20=>[10, 5, 2], 121=>[], 120=>[10, 5, 2, 20]})
        end
        
        it 'should return correct hash filtering negative numbers [20, 10, 5, 2, -1,-12]' do
            results = factor.find_all_factors_in_array([20, 10, 5, 2, -1,-12])
            expect(results).to eq({20=>[10,5,2], 10=>[5,2], 5=>[], 2=>[]})
        end
    end
    
    context "Testing Reverse Output" do
        it 'should return correct hash [10, 5, 2, 20]' do
            results = factor.find_all_factors_in_array([10, 5, 2, 20], true)
            expect(results).to eq({10=>[20], 5=>[10, 20], 2=>[10, 20], 20=>[]} )
        end
        
        it 'should return correct hash [2, 5, 10, 20]' do
            results = factor.find_all_factors_in_array([2, 5, 10, 20], true)
            expect(results).to eq({2=>[10, 20], 5=>[10, 20], 10=>[20], 20=>[]})
        end
        
        it 'should return correct hash [20, 10, 5, 2]' do
            results = factor.find_all_factors_in_array([20, 10, 5, 2], true)
            expect(results).to eq({20=>[], 10=>[20], 5=>[20, 10], 2=>[20, 10]})
        end
        
        it 'should return correct hash without duplicates [10, 5, 2, 20, 5, 121, 120]' do
            results = factor.find_all_factors_in_array([10, 5, 2, 20, 5, 121, 120], true)
            expect(results).to eq({10=>[20, 120], 5=>[10, 20, 120], 2=>[10, 20, 120], 20=>[120], 121=>[], 120=>[]})
        end
        
        it 'should return correct hash filtering negative numbers [20, 10, 5, 2, -1,-12]' do
            results = factor.find_all_factors_in_array([20, 10, 5, 2, -1,-12], true)
            expect(results).to eq({20=>[], 10=>[20], 5=>[20, 10], 2=>[20, 10]})
        end
    end
    
end