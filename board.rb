class Board

  def initialize(open_pos=0)
    @nodes = (0..14).to_a.map do |n|
      Node.new(n, n != open_pos, self)
    end
    @history = []
    @activenodes = (0..14).to_a.delete_if { |n| n == open_pos }
    @remaining = 14
  end

  def move(from, to, over)
    @nodes[from].is_occupied = false
    @nodes[to].is_occupied = true
    @nodes[over].is_occupied = false
    @activenodes.delete_if { |n| n == from }
    @activenodes.delete_if { |n| n == over }
    @activenodes.push(to)
    @history.push("from: #{from}, to: #{to}, over: #{over}")
    @remaining -= 1
  end

  def rewind(from, to, over)
    @nodes[from].is_occupied = true
    @nodes[to].is_occupied = false
    @nodes[over].is_occupied = true
    @activenodes.delete_if { |n| n == to }
    @activenodes.push(from)
    @activenodes.push(over)
    @history.pop
    @remaining += 1
  end

  def moves
    m = []
    @activenodes.each do |node_num|
      moves = @nodes[node_num].moves
      m += moves if moves.any?
    end
    m
  end

  def nodes
    @nodes
  end

  def remaining
    @remaining
  end

  def history
    @history
  end

end
