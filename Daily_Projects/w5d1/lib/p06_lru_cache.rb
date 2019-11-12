require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @store.include?(key)
      @map.get(key)
      update_node!(key)
    else
      @prc.call(key)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    @store.append(key)
  end

  def update_node!(key)
    # suggested helper method; move a node to the end of the list
    @store.remove(key)
    @store.append(key)
  end

  def eject!
    @store.remove(@store.head.next.key)
  end
end
