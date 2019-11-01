require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    
    def initialize(n, hash)
        @all_players = []
        hash.each do |k, v|
            if v == false
                @all_players << HumanPlayer.new(k)
            else
                @all_players << ComputerPlayer.new(k)
            end
        end
        @board = Board.new(n)
        @current_player = @all_players[0]
    end

    def switch_turn
        idx = @all_players.index(@current_player)
        new_idx = (idx+1) % @all_players.length
        @current_player = @all_players[new_idx]
    end
    
    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark)
            if @board.win?(@current_player.mark) 
                puts "Victory to Player #{@current_player.mark}!!"
                return  
            else 
                self.switch_turn 
            end 
        end
        puts "Draw"
    end
end