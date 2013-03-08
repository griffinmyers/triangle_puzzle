import board
import time

for peg in [0, 10, 14, 1, 2, 6, 11, 13, 9, 4, 7, 8, 3, 5, 12]:

  brd = board.Board(peg)
  start = time.time()

  def play(brd):

    if(len(brd.moves()) > 0):
      count = 0
      for move in brd.moves():
        brd.move(move[0], move[1], move[2])
        count += play(brd)
        brd.rewind(move[0], move[1], move[2])
      return count
    else:
      if(brd.remaining == 1):
        # print("## Begin Solution ##")
        # brd.print_history()
        # print("## End Solution ##")
        return 1
      else:
        return 0

  print("There are {0} solutions for opening peg: {1} (took {2} seconds)".format(play(brd), peg, time.time() - start))
