#Output: In whatever representation you wish, output each integer in the array and all the other integers in the array that are
#factors of the first integer.

#Example:
#Given an array of [10, 5, 2, 20], the output would be:
# {10: [5, 2], 5: [], 2: [], 20: [10,5,2]}

#array: [10, 5, 2, 20]
#result: {10=>[5, 2], 5=>[], 2=>[], 20=>[10, 5, 2]}
#ReverseResult: {10=>[20], 5=>[10, 20], 2=>[10, 20], 20=>[]}


class Factor
  include FactorHelper

  attr_accessor :array, :factors, :reverse


  def initialize(array, reverse = false)
    check_base_cases(array)
    self.array = array.uniq.sort
    self.factors = {}
    self.reverse = reverse
  end

  def is_reverse?
    self.reverse == true
  end

  def find_all_factors_in_array
    self.array.each do |index|
      next if index < 0
      next if self.factors.has_key?(index)
      self.factors[index] = find_all_factors(index)
    end
    factors
  end

end