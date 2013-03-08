require_relative 'board'

[0, 10, 14, 1, 2, 6, 11, 13, 9, 4, 7, 8, 3, 5, 12].each do |peg|

  start = Time.now
  # Start with the 0 peg being open
  board = Board.new(peg)

  def play(board)
    if board.moves.any?
      count = 0
      board.moves.each do |move|
        board.move(move[0], move[1], move[2])
        count += play(board)
        board.rewind(move[0], move[1], move[2])
      end
      count
    else
      if board.remaining == 1
        # puts "## Begin Solution ##"
        # puts board.history
        # puts "## End Solution ##"
        1
      else
        0
      end
    end

  end

  puts "There are #{play(board)} solutions for opening peg: #{peg} (took #{Time.now - start} seconds)"

end