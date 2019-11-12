class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    self[key] << key
    @count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1 
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    key_hash = num.hash
    @store[key_hash%num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    buckets = Array.new(num_buckets) { Array.new }
    @store.concat(buckets)
    @store.flatten.each do |ele|
      @store[ele%num_buckets] << ele
    end
  end
end
