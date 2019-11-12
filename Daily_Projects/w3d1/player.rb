class Player
    attr_reader :name
    def initialize(name)
        @name = name
        @g_char = 1
    end

    def guess
        puts "Enter the next letter: "
        while self.alert_invalid_guess(@g_char)
            @g_char = gets.chomp
        end
        @g_char
    end

    def alert_invalid_guess(char)
        alpha = "abcdefghijklmnopqrstuvwxyz"
        char.length == 1 && alpha.include?(char)
    end
end