class ComputerPlayer
    attr_reader :mark 

    def initialize(mark_value)
        @mark = mark_value
    end 

    def get_position(legal_positions)
        puts "Computer #{@mark}, enter coordinates. Example: 0 1"
        coord = legal_positions.sample
        puts "Computer #{@mark} added a mark at #{coord}" 
        coord
    end
end 