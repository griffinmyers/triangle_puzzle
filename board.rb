class Board

  def initialize(open_pos=0)
    @nodes = (0..14).to_a.map do |n|
      Node.new(n, n != open_pos, self)
    end
    @history = []
  end

  def move(from, to, over)
    @nodes[from].isOccupied = false
    @nodes[to].isOccupied = true
    @nodes[over].isOccupied = false
    @history.push("from: #{from}, to: #{to}, over: #{over}")
  end

  def nodes
    @nodes
  end

  def remaining
    @nodes.reduce(0) do |memo, node|
      memo = memo + 1 if node.isOccupied
      memo
    end
  end

  def moves
    node = @nodes.reduce([]) do |memo, node|
      memo + node.moves
    end
  end

  def history
    @history
  end

end