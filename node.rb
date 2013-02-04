require 'pry'

class Node

  def initialize(number, isOccupied, board)
    @number = number
    @isOccupied = isOccupied
    @board = board
  end

  def moves
    move_map[@number].select do |m|
      # m[0] is the node being jumped
      # m[1] is the node being jumped to
      nodes[m[0]].isOccupied && !nodes[m[1]].isOccupied && nodes[@number].isOccupied
    end.map { |m| [@number, m[1], m[0]] }
    # return from, to, over
  end

  def isOccupied
    @isOccupied
  end

  def isOccupied=(thing)
    @isOccupied = thing
  end

  private
  def nodes
    @board.nodes
  end

  def move_map
    {
      0 => [[1, 3], [2, 5]],
      1 => [[4, 8], [3, 6]],
      2 => [[4, 7], [5, 9]],
      3 => [[1, 0], [8, 10], [7, 12], [4, 5]],
      4 => [[7, 11], [8, 13]],
      5 => [[2, 0], [9, 14], [8, 12], [4, 3]],
      6 => [[3, 1], [7, 8]],
      7 => [[4, 2], [8, 9]],
      8 => [[4, 1], [7, 6]],
      9 => [[5, 2], [8, 7]],
      10 => [[6, 3], [11, 12]],
      11 => [[7, 4], [12, 13]],
      12 => [[7, 3], [8, 5], [11, 10], [13, 14]],
      13 => [[8, 4], [12, 11]],
      14 => [[9, 5], [13, 12]]
    }
  end

end