class EQ_Puz
    attr_reader :board
    def initialize
        @board = Array.new(8) {Array.new(8, "_")}
        @queen_coords = []
        @solutions = []
        @queens = 8
        @solution_count = 92
    end

    def disable_row(row)
        (0..7).each do |col|
            @board[row][col] = "X"
        end
    end

    def disable_col(col)
        (0..7).each do |row|
            @board[row][col] = "X"
        end
    end

    def disable_diag(row,col)
        (0..7).each do |num|
            @board[row-num][col-num] = "X" unless row-num < 0 || col-num < 0
            @board[row+num][col+num] = "X" unless row+num > 7 || col+num > 7
            @board[row-num][col+num] = "X" unless row-num < 0 || col+num > 7
            @board[row+num][col-num] = "X" unless row+num > 7 || col-num < 0
        end
    end

    def available_coord
        avail_coords = []
        @board.each_with_index do |row, x|
            row.each_with_index do |col, y|
                if @board[x][y] == "_"
                    avail_coords << [x, y]
                end
            end
        end
        avail_coords
    end

    def disable_coord(raw_coord)
        row = raw_coord[0]
        col = raw_coord[1]
        self.disable_row(row)
        self.disable_col(col)
        self.disable_diag(row,col)
        @board[row][col] = "O"
    end


    def place_queen(raw_coord)
        self.disable_coord(raw_coord)
        @queen_coords << raw_coord
        @queens -= 1
    end

    def print
        @board.each do |row|
            puts row.join(" ")
        end
        puts "\n"
    end

    def reset
        @board = Array.new(8) {Array.new(8, "_")}
        @queen_coords = []
        @queens = 8
    end

    def check_for_deadlock
        if available_coord[0] == nil && @queens != 0
            self.reset
        end
    end

    def find_solutions
        while @solution_count > 0
            while @queens > 0
                self.place_queen(self.available_coord.sample)
                self.check_for_deadlock
            end
            @queen_coords = @queen_coords.sort {|coord1, coord2| coord1[0] <=> coord2[0]}
            if !@solutions.include?(@queen_coords)
                @solutions << @queen_coords
                @solution_count -= 1
                self.print
            end
            self.reset
        end
    end
end
puz = EQ_Puz.new.find_solutions