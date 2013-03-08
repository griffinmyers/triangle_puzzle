class Board:

  MOVE_MAP = {
    0: [[1, 3], [2, 5]],
    1: [[4, 8], [3, 6]],
    2: [[4, 7], [5, 9]],
    3: [[1, 0], [6, 10], [7, 12], [4, 5]],
    4: [[7, 11], [8, 13]],
    5: [[2, 0], [9, 14], [8, 12], [4, 3]],
    6: [[3, 1], [7, 8]],
    7: [[4, 2], [8, 9]],
    8: [[4, 1], [7, 6]],
    9: [[5, 2], [8, 7]],
    10: [[6, 3], [11, 12]],
    11: [[7, 4], [12, 13]],
    12: [[7, 3], [8, 5], [11, 10], [13, 14]],
    13: [[8, 4], [12, 11]],
    14: [[9, 5], [13, 12]]
  }

  def __init__(self, open_pos):
    self.nodes = [elem != open_pos for elem in range(0, 15)]
    self.history = []
    self.active_nodes = [elem for elem in range(0, 15) if not elem == open_pos]
    self.remaining = 14

  def move(self, frm, to, over):
    self.nodes[frm] = False
    self.nodes[to] = True
    self.nodes[over] = False
    self.active_nodes = [elem for elem in self.active_nodes if not (elem == frm or elem == over)]
    self.active_nodes.append(to)
    self.history.append("from: {0}, to: {1}, over: {2}".format(frm, to, over))
    self.remaining -= 1

  def rewind(self, frm, to, over):
    self.nodes[frm] = True
    self.nodes[to] = False
    self.nodes[over] = True
    self.active_nodes = [elem for elem in self.active_nodes if not (elem == to)]
    self.active_nodes.append(frm)
    self.active_nodes.append(over)
    self.history.pop()
    self.remaining += 1

  def moves(self):
    m = []
    for node_num in self.active_nodes:
      m.extend(self.node_moves(node_num))
    return m

  def node_moves(self, node_num):
    move_list = []
    for m in Board.MOVE_MAP[node_num]:
      if(self.nodes[m[0]] and not self.nodes[m[1]]):
        move_list.append([node_num, m[1], m[0]])
    return move_list

  def print_history(self):
    for move in self.history:
      print(move)
