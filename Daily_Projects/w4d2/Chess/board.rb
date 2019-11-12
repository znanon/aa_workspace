require_relative "./pieces/piece"
 
class Board
  attr_accessor :board
  def initialize
    @board = Array.new(8) {Array.new(8, nil)}
    @board[0] = Array.new(8) {Piece.new}
    @board[1] = Array.new(8) {Piece.new}
    @board[-1] = Array.new(8) {Piece.new}
    @board[-2] = Array.new(8) {Piece.new}
  end

  def [](pos)
    x,y = pos
    self.board[x][y]
  end
  def []=(pos, piece)
    x,y = pos
    self.board[x][y] = piece
  end

  def valid_pos?(pos)
    x, y = pos
    return false if x > 7 || x < 0
    return false if y > 7 || y < 0
    true
  end
  def move_piece(start_pos, end_pos)
      if self[start_pos] != nil && self.valid_pos?(end_pos)
        self[end_pos] = self[start_pos] #self[start_pos]
        self[start_pos] = nil
      else
        raise "wrong pos"
      end
  end
end

b = Board.new 
puts b[[7,0]]
puts b.move_piece([0,0], [8,0])
