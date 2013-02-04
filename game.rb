require_relative 'board'
require_relative 'node'

board = Board.new(0)

def play(board)

  if board.moves.any?
    board.moves.each do |move|
      board_dup = Marshal.load(Marshal.dump(board))
      board_dup.move(move[0], move[1], move[2])
      play(board_dup)
    end
  else
    if board.remaining == 1
      puts " ##begin solution ##"
      puts board.history
      puts " ##end solution ##"
    end
  end

end

play(board)