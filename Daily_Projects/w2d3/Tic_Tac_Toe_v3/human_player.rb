class HumanPlayer
    attr_reader :mark 

    def initialize(mark_value)
        @mark = mark_value
    end 

    def get_position(legal_positions)
        puts "Player #{@mark}, enter coordinates. Example: 0 1"
        coord = gets.chomp.split(" ").map {|el| el.to_i}
        while !legal_positions.include?(coord)
            puts "Enter legal coordinates"
            coord = gets.chomp.split(" ").map {|el| el.to_i}
        end 
        puts "Player #{@mark} added a mark at #{coord}" 
        coord 
    end 
end 

 