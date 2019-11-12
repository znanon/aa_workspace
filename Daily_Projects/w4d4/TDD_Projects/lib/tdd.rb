class Array

  def my_uniq
    arr = []
    self.each do |el|
      arr << el if !arr.include?(el)
    end
    arr
  end

  def two_sum
    arr = []
    (0...self.length).each do |idx1|
      (idx1+1...self.length).each do |idx2|
        arr << [idx1, idx2] if self[idx1]+self[idx2] == 0
      end
    end
    arr
  end

  def my_transpose
    matrix = Array.new(self.length) {Array.new(self.length)}
    (0...self.length).each do |row|
      (0...self.length).each do |col|
        matrix[col][row] = self[row][col]
      end
    end
    matrix
  end

  def stock_picker
    i = 1
    j = 0
    max_profit = [0,0]
    while i < self.length
      x,y = max_profit
      profit = self[i]-self[j]
      max_profit = [j,i] if profit > (self[y]-self[x])
      j = i if self[i] < self[j]
      i += 1
    end
    max_profit
  end
end


class TowerOfHanoi
  attr_accessor :t1, :t2, :t3, :win_tower
  
  def initialize
    @t1 = [[3],[2],[1]]
    @t2 = []
    @t3 = []
    @win_tower = @t1.dup
  end

  def move(current_tower, des_tower)
    # return false if current_tower.empty? #|| des_tower[-1][0] > current_tower[-1][0]
    # des_tower.push(current_tower.pop)
    # true
    
    if !current_tower.empty? && (des_tower.empty? || des_tower[-1][0] > current_tower[-1][0])
      des_tower.push(current_tower.pop)
      des_tower
    else
      raise "You're not allowed to move this piece to that tower"
    end
  end

  def won?
    return true if @t3 == @win_tower
    false
  end
end