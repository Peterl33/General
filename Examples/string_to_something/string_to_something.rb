class StringToSomething
  attr_accessor :hash , :results

  def initialize(s)
    @hash = s
    @results = []
  end

  def filter_string
    @hash.sub!('{','')
    @hash.sub!('}','')
  end

  def find_potential_keys
    @hash = @hash.split(/ ([0-9]|[a-zA-Z])+:/)
  end

  def split_keys
    @hash.each do |str|
      if str[/[0-9][0-9]:[0-9][0-9]([aA][mM]|[pP][mM])/].nil?
        @results << str.split(':')
      else
        @results << str
      end
    end
  end

  def prepare_hash_from_string
      result = []
      @results.each do |str|
        if str.is_a? Array
          str.each{|x| result << x}
        else
          result << str
        end
      end
      @results = result
  end

  def clean_up_and_create_hash
    @results.each do |str|
      data = clean_up_value(str)
      balanced_array_brackets?(data) ? str = data : str = clean_extra_bracket(data)
      str
    end
    temp_hash = {}
    while @results.length > 1
      temp_hash[@results[0]] = results[1]
      @results.shift(2)
    end
    temp_hash[@results[0]] = nil if @results.length == 1
    @results = temp_hash
  end

  def return_hash
    @results
  end

  def return_hash_to_json
    @results.to_json
  end

  def process_string_to_hash
    self.filter_string
    self.find_potential_keys
    self.split_keys
    self.prepare_hash_from_string
    self.clean_up_and_create_hash
    self.return_hash
  end

  private
  def clean_up_value(s)
    s[-1] = '' if s[-1] == ','
    s
  end

  def balanced_array_brackets?(s)
    puts "S in balanced_array_brackets #{s}"
    s.count('[') == s.count(']')
  end

  def clean_extra_bracket(s)
    s[-1] = '' if s[-1] == '['
    s[-1] = '' if s[-1] == ']'
    s
  end

 end