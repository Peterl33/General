#Output: In whatever representation you wish, output each integer in the array and all the other integers in the array that are
#factors of the first integer.

#Example:
#Given an array of [10, 5, 2, 20], the output would be:
# {10: [5, 2], 5: [], 2: [], 20: [10,5,2]}

#test data: [[10, 5, 2, 20], [2,5,10,20], [20,10,5,2],[10, 5, 2, 20, 5, 121, 120]]
#test Results
#testData1 result = {10=>[5, 2], 5=>[], 2=>[], 20=>[10, 5, 2]}
#testData2 result = {2=>[], 5=>[], 10=>[2,5], 20=>[2,5,10]}
#testData3 result = {20=>[10,5,2], 10=>[5,2], 5=>[], 2=>[]}
#testData4 result = {10=>[5, 2], 5=>[], 2=>[], 20=>[10, 5, 2], 121=>[], 120=>[10, 5, 2, 20]}

class Factor
    
    def find_all_factors_in_array(array, reverse=nil)
        # --> base conditions
        return "parameter must be an array! " if !array.is_a?(Array)
        return "no factors found" if array && array.size < 2
        # --> result hash
        factors = {}
        # --> loop through data
        array.each do |index|
            next if index < 0
            # --> check if key exist.. next if key is found
            # --> Simulation of # additional question 1.
            factors.has_key?(index)? next : factors[index]=[]
            array.each do |k|
                # --> configuration added to handle reverse printout.
                filter = reverse.blank?? (index % k).zero? : ((index / k).zero? && (k % index).zero?)
                # --> if value is the same as the key ... next
                next if index == k || k <= 0
                # --> if we already calculated key.. append values to current hash key ...
                if(factors[k] && k < index)
                    if(filter)
                        factors[index] << k
                        factors[index] << factors[k]
                        factors[index].flatten!
                    end
                    else
                    factors[index] << k if(filter)
                end
                # --> make sure values in hash are unique.
                factors[index].uniq!
            end
        end
        factors
    end
    
end
