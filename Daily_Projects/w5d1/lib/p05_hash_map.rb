require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[bucket(key)].each do |node|
      if node.key == key
        return true
      end
    end
    false
  end

  def set(key, val)
    @store[bucket(key)].each do |node|
      if node.key == key
        node.val = val
      end
    end
    if !self.include?(key)
      resize! if num_buckets == count
      @store[bucket(key)].append(key, val)
      @count += 1
    end
  end

  def get(key)
    @store[bucket(key)].each do |node|
      if node.key == key
        return node.val
      end
    end
    nil
  end

  def delete(key)
    @store[bucket(key)].remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |linked|
      linked.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets) { LinkedList.new }
    new_store = Array.new(num_buckets*2) { LinkedList.new }
    self.each do |k, v|
      new_store[bucket(k)].append(k, v)
    end
    @store = new_store
  end

  def bucket(key)
    (key.hash)%num_buckets
    # optional but useful; return the bucket corresponding to `key`
  end

end
