require_relative 'tic_tac_toe_node'
require_relative 'tic_tac_toe'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    current_board = TicTacToeNode.new(game.board, mark)
    # (0..2).each do |x|
    #   (0..2).each do |y|
    #     current_board=TicTacToeNode.new(game.board, mark, [x, y])
    #     if current_board.winning_node?(mark)
    #       return [x, y]
    #     end
    #   end
    # end  
    current_board.children.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos 
      elsif child.winning_node?(:x) && mark == :o
        return child.prev_move_pos
      elsif child.winning_node?(:o) && mark == :x
        return child.prev_move_pos
      end
    end
    raise "Error"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
