class Board
    attr_reader :grid 

    def initialize(n)
        @grid = Array.new(n) {Array.new(n,"_")} 
    end

    def valid?(position)
        (0..@grid.length).include?(position[0]) && (0..@grid.length).include?(position[1])
    end

    def empty?(position)
        @grid[position[0]][position[1]] == "_"
    end

    def place_mark(position, mark)
        raise unless self.valid?(position) && self.empty?(position)
        @grid[position[0]][position[1]] = mark 
    end 

    def print 
        @grid.each {|row| puts row.join(" ")}
    end 

    def win_row?(mark)
        @grid.each do |row| 
            return true if row.all? {|ele| ele == mark}
        end 
        false 
    end 

    def win_col?(mark)
        @grid.transpose.each do |row| 
            return true if row.all? {|ele| ele == mark}
        end 
        false     
    end

    def win_diagonal?(mark)
        i = 0
        count = 0
        while i < @grid.length
            count += 1 if @grid[i][i] == mark
            i += 1
            return true if count == @grid.length
        end
        j = 0
        k = @grid.length - 1
        c2 = 0
        while j < @grid.length 
            c2 += 1 if @grid[j][k] == mark
            j+=1
            k-=1
            return true if c2 == @grid.length
        end
        false
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end 

    def empty_positions?
        @grid.each_with_index do |row, i|
            row.each_with_index do |col, j|
                if self.empty?([i, j])
                    return true 
                end 
            end 
        end 
        false 
    end 

    def legal_positions
        legals = []
        @grid.each_with_index do |row, i|
            row.each_with_index do |col, j|
                if self.empty?([i, j]) && self.valid?([i,j])
                    legals << [i, j]
                end 
            end 
        end 
        legals 
    end 
end


# p test_board.valid?([0,0])
# p test_board.valid?([3,3])
# #  p test_board.empty?([0,0])
# test_board.place_mark([0, 0], :X)
# test_board.place_mark([0, 1], :X)
# test_board.place_mark([0, 2], :X)
# test_board.place_mark([1, 0], :X)
# test_board.place_mark([1, 1], :X)
# test_board.place_mark([1, 2], :X)
# test_board.place_mark([2, 0], :X)
# test_board.place_mark([2, 1], :X)
# test_board.place_mark([2, 2], :X)
#  p test_board.grid 
#  p test_board.place_mark([1, 1], "X")
#  p test_board.grid

#  p test_board.empty_positions?

