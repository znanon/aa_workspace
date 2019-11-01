class Player

    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"
        input = gets.chomp 
        ints = input.split(" ")
        ints[0] = ints[0].to_i 
        ints[1] = ints[1].to_i 
        ints
    end
end
