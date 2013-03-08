class Board

  # If I'm Peg 0, then I can move to Peg 3 (jumping Peg 1) or I can move
  # to Peg 5 (jumping Peg 2) is represented by:
  #
  # 0 => [[1, 3], [2, 5]]
  #
  MOVE_MAP = {
    0 => [[1, 3], [2, 5]],
    1 => [[4, 8], [3, 6]],
    2 => [[4, 7], [5, 9]],
    3 => [[1, 0], [6, 10], [7, 12], [4, 5]],
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


  def initialize(open_pos=0)
    @nodes = (0..14).to_a.map { |n| n != open_pos }
    @history = []
    @active_nodes = (0..14).to_a.delete_if { |n| n == open_pos }
    @remaining = 14
  end

  def move(from, to, over)
    @nodes[from] = false
    @nodes[to] = true
    @nodes[over] = false
    @active_nodes.delete_if { |n| n == from }
    @active_nodes.delete_if { |n| n == over }
    @active_nodes.push(to)
    @history.push("from: #{from}, to: #{to}, over: #{over}")
    @remaining -= 1
  end

  def rewind(from, to, over)
    @nodes[from] = true
    @nodes[to] = false
    @nodes[over] = true
    @active_nodes.delete_if { |n| n == to }
    @active_nodes.push(from)
    @active_nodes.push(over)
    @history.pop
    @remaining += 1
  end

  def moves
    m = []
    @active_nodes.each do |node_num|
      moves = node_moves(node_num)
      m += moves if moves.any?
    end
    m
  end

  def node_moves(node_num)
    move_list = []
    MOVE_MAP[node_num].each do |m|
      # m[0] is the node being jumped
      # m[1] is the node being jumped to
      if @nodes[m[0]] && !@nodes[m[1]]
        move_list.push([node_num, m[1], m[0]])
        # return from, to, over
      end
    end
    move_list
  end

  def remaining
    @remaining
  end

  def history
    @history
  end

end