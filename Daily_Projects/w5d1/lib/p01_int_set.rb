class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    if !is_valid?(num)
      raise "Out of bounds"
    end
    @store[num] = true
  end

  def remove(num)
    if !is_valid?(num)
      raise "Out of bounds"
    end
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num < @max && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num%num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      if count == num_buckets
        resize!
      end
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)    
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num%num_buckets]
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
