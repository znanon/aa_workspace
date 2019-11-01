require_relative "./dictionary.txt"
require_relative "./player.rb"

class Game
    @attr_reader :current_player, :previous_player
    def initialize(num)
        @players = Array.new(num) {|ele| ele = Player.new}
        @losses = {}
        @players.each do |player|
            @losses[player] = 0
        end
        @current_player = @players[0]
        @previous_player = @players[@players.length-1]
        @fragment = ""
        @dictionary = Hash.new(0)
        File.open('dictionary.txt').each do |word|
            @dictionary[word] = word
        end
    end

    def next_player!
        @previous_player = @current_player
        @current_player = @players[(@players.index(@current_player)+1)%(@players.length-1)]
    end

    def take_turn(player)
        fragment += player.guess
    end

    def round_end?
        @dictionary.has_hash?(fragment)
    end

    def reset_round
        puts "Round Ended! #{@current_player.name} lost the round!\n"
        fragment = ""
        @losses[@current_player] += 1
        if losses[@current_player] == 5
            self.player_lost(@current_player) 
        end
    end

    def player_lost(player)
        puts "#{@current_player.name} is a GHOST!"
        @current_player = @players[(@players.index(@current_player)+1)%(@players.length)]
        @players.delete_at(@players.index(@current_player))
    end

    def game_over
        @players.length == 1
    end    

    def play_game
        while !game_over?
            self.take_turn
            self.next_player!
            self.reset_round if self.round_end?        
        end
        puts "Game Over! Congratulations #{@current_player}!\n"
    end
end