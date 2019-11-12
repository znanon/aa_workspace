class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_value = 0
    self.each do |ele|
      hash_value ^= ele.hash
      hash_value = hash_value << 2
    end
    hash_value
  end
end

class String
  def hash
    hash_value = 0
    self.each_char.with_index do |c, i|
      hash_value ^= c.ord.hash
      hash_value = hash_value << 2
    end
    hash_value
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_value = 0
    self.each do |k, v|
      hash_value ^= k.hash
      hash_value ^= v.hash
    end
    hash_value
    end
end
