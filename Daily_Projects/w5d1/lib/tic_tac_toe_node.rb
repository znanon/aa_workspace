require_relative 'tic_tac_toe'
require_relative 'super_computer_player'
require 'byebug'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @children = []
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if @board.winner != evaluator && @board.over?
    return false if (@board.winner == evaluator || @board.winner == nil) && @board.over?
    # debugger
    if @next_mover_mark == evaluator
      self.children.all? do |child|
        child.losing_node?(evaluator)
      end
    else
      self.children.any? do |child|
        child.losing_node?(evaluator)
      end
    end
  end

  def winning_node?(evaluator)
    return true if @board.winner == evaluator && @board.over?
    return false if (@board.winner != evaluator || @board.winner == nil) && @board.over?
    if @next_mover_mark == evaluator
      self.children.any? do |child|
        child.winning_node?(evaluator)
      end
    else
      self.children.all? do |child|
        child.winning_node?(evaluator)
      end
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    (0..2).each do |x|
      (0..2).each do |y|
        if @board[[x,y]] == nil
          board_copy = @board.dup
          board_copy[[x,y]] = @next_mover_mark
          @children << TicTacToeNode.new(board_copy, :o, [x,y]) if @next_mover_mark == :x
          @children << TicTacToeNode.new(board_copy, :x, [x,y]) if @next_mover_mark == :o
        end
      end
    end
    @children   
  end
end
