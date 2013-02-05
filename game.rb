require_relative 'board'
require_relative 'node'

# Start with the 0 peg being open
board = Board.new(0)

def play(board)
  if board.moves.any?
    board.moves.each do |move|
      board.move(move[0], move[1], move[2])
      play(board)
      board.rewind(move[0], move[1], move[2])
    end
  else
    if board.remaining == 1
      puts " ## begin solution ##"
      puts board.history
      puts " ## end solution ##"
    end
  end

end

play(board)
