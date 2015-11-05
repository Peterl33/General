class FileReader
  def initalize
    @hash = {}
    @master_id_hash =[]
    @hash = {}
    @results =''
  end

  def self.read_external_file(file_path)
    data_set = []
    master_id_hash = []
    hash = {}
    results =''
    File.open(file_path, "r") do |f|
      f.each_line do |line|
        if hash.empty?
          hash = create_hash_keys(line.split)
          next
        else
          data = clean_data_up_and_split(line)
          data_set = create_initial_data_array(data, hash) if data_set.empty?
          results = compare_and_update_data_sets(data_set, data, master_id_hash)
        end
      end
      final_hash = transform_data_into_hash(hash,results, master_id_hash)
      puts final_hash
    end

  end

  def self.create_hash_keys(strings)
    hash = Hash.new
    strings.each do |k|
      hash[k.to_s] = ''
    end
    hash
  end

  def self.clean_data_up_and_split(strings)
    array_of_strings = strings.chop.split("\t")
    array_of_strings
  end

  def self.create_initial_data_array(array, hash)
    data = Array.new(hash.size, '')
    array.each_with_index { |v, k| data[k] =  v }
    data
  end

  def self.compare_and_update_data_sets(data_set, new_data, master_id_hash)
    if data_set
      for i in 0 .. data_set.length
        data_set[i] = compare_data_set(data_set[i], new_data[i])
        data_set[i] == new_data[i] ? master_id_hash[i] = new_data[0] : master_id_hash[i] = master_id_hash[i]
      end
      data_set.compact!
    end
    data_set
  end

  def self.compare_data_set(old, new)
    return new if old.nil?
    return old if new.nil?
    return '' if old.nil? and new.nil?
    old.length >= new.length ? old : new
  end

  def self.transform_data_into_hash(hash,results, master_id_hash)
    i=0
    hash.each do |k,v|
      hash[k] = [results[i].size , master_id_hash[i]]
      hash[k] = [0,''] if results[i].size == 0
      i += 1
    end
  end

  read_external_file(ARGV.first)
end