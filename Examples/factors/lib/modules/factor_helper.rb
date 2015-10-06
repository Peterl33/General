module FactorHelper
  def check_base_cases(array)
    raise "parameter must be an array! " if !array.is_a?(Array)
    raise "no factors found" if array && array.size < 2
  end

  def find_all_factors(num)
    self.is_reverse?? self.array.select{|x| x % num == 0 if x != num}: self.array.select{|x| num % x == 0 if x != num}
  end

end