class Board

    attr_reader :size 

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n*n 
  end

  def [](arr)
    @grid[arr[0]][arr[1]] 
  end 

  def []=(position, val)    
    @grid[position[0]][position[1]] = val 
  end 

  def num_ships
    count = 0
    @grid.each do |row|
        row.each do |col|
            if col == :S 
                count += 1 
            end 
        end 
    end 
    count 
  end 

  def attack(position)
    if self[position] == :S 
        self[position] = :H
        puts "you sunk my battleship!"
        return true 
    else 
        self[position] = :X
    end 
    false 
  end 

  def place_random_ships
    amount = 0.25 * @size
    until self.num_ships == amount
      col = rand(0...@grid.length)
      row = rand(0...@grid.length)
      position = [row, col]
      if self[position] != :S
        self[position] = :S
      end
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |col|
        if col == :S 
          :N
        else
          col
        end 
      end 
    end
  end

  def self.print_grid(grid)
    grid.each {|row| puts row.join(" ") }
  end 

  def cheat
    Board.print_grid(@grid)
  end 

  def print 
    Board.print_grid(self.hidden_ships_grid)
  end 

end
