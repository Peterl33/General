class Sample
  def initialize(h)
    @h = h
    @h.each do |key, value|
      self.class.send(:attr_accessor, key)
      self.send("#{key}=", value)
    end
  end
end