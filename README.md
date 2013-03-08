triangle puzzle
===============

This is an awful brute-force solution to the [triangle-puzzle](http://www.officeplayground.com/Assets/ProductPreview/pi3000-3199/3174_peggame_1.jpg) thing where
you have pegs that jump other pegs. 

It shouldn't be used by anyone for any reason.

This code shouldn't be looked at by anyone for any reason. 

If you must, though:

    ruby ruby/game.rb

    python3 python/game.py

    g++ -Wall -I . c++/main.cpp c++/board.cpp -o c++/game.tsk
    c++/game.tsk

The board is set up with nodes like this:

            0
          1   2
        3   4   5
      6   7   8   9
    10  11  12  13  14  
    

ruby vs python vs c++
===========

I originally wrote this in Ruby and then ported it over to Python and C++, because it's fun to do bad things. You can see the speed comparisons below.


solutions
=========

Generated solutions will look something like this: 

    ## begin solution ##
    from: 3, to: 0, over: 1
    from: 5, to: 3, over: 4
    from: 13, to: 4, over: 8
    from: 6, to: 1, over: 3
    from: 12, to: 3, over: 7
    from: 0, to: 5, over: 2
    from: 9, to: 2, over: 5
    from: 2, to: 7, over: 4
    from: 1, to: 6, over: 3
    from: 10, to: 3, over: 6
    from: 3, to: 12, over: 7
    from: 11, to: 13, over: 12
    from: 14, to: 12, over: 13
    ## end solution ##
    
Line 1 means "move peg 3 to peg 0 over peg 1". I guess I could have outputted exactly that. Win some lose some.

curiosity satisfied
===================

All of these tests were run on an archaic MBP (the kind with the good keyboard), and should just be compared relative to one another. 

Ruby 2.0.0
----------

    There are 29760 solutions for opening peg: 0 (took 22.355432 seconds)
    There are 29760 solutions for opening peg: 10 (took 23.350774 seconds)
    There are 29760 solutions for opening peg: 14 (took 21.151218 seconds)
    There are 14880 solutions for opening peg: 1 (took 10.62009 seconds)
    There are 14880 solutions for opening peg: 2 (took 10.564013 seconds)
    There are 14880 solutions for opening peg: 6 (took 10.638102 seconds)
    There are 14880 solutions for opening peg: 11 (took 10.853657 seconds)
    There are 14880 solutions for opening peg: 13 (took 10.813831 seconds)
    There are 14880 solutions for opening peg: 9 (took 10.874884 seconds)
    There are 1550 solutions for opening peg: 4 (took 5.541934 seconds)
    There are 1550 solutions for opening peg: 7 (took 5.533112 seconds)
    There are 1550 solutions for opening peg: 8 (took 5.538741 seconds)
    There are 85258 solutions for opening peg: 3 (took 48.503411 seconds)
    There are 85258 solutions for opening peg: 5 (took 48.774407 seconds)
    There are 85258 solutions for opening peg: 12 (took 51.382318 seconds)

Python 3.3
----------

    There are 29760 solutions for opening peg: 0 (took 35.708173990249634 seconds)
    There are 29760 solutions for opening peg: 10 (took 34.000802993774414 seconds)
    There are 29760 solutions for opening peg: 14 (took 36.646321058273315 seconds)
    There are 14880 solutions for opening peg: 1 (took 18.07257890701294 seconds)
    There are 14880 solutions for opening peg: 2 (took 16.655473947525024 seconds)
    There are 14880 solutions for opening peg: 6 (took 15.478764057159424 seconds)
    There are 14880 solutions for opening peg: 11 (took 15.762180089950562 seconds)
    There are 14880 solutions for opening peg: 13 (took 16.501535892486572 seconds)
    There are 14880 solutions for opening peg: 9 (took 15.400413990020752 seconds)
    There are 1550 solutions for opening peg: 4 (took 7.705054044723511 seconds)
    There are 1550 solutions for opening peg: 7 (took 7.710479021072388 seconds)
    There are 1550 solutions for opening peg: 8 (took 7.931739091873169 seconds)
    There are 85258 solutions for opening peg: 3 (took 59.32545304298401 seconds)
    There are 85258 solutions for opening peg: 5 (took 58.257325887680054 seconds)
    There are 85258 solutions for opening peg: 12 (took 58.63081407546997 seconds)

C++
---

    There are 29760 solutions when the 0 peg is open first (took 4.23545 seconds)
    There are 29760 solutions when the 10 peg is open first (took 4.24797 seconds)
    There are 29760 solutions when the 14 peg is open first (took 4.28294 seconds)
    There are 14880 solutions when the 1 peg is open first (took 2.24551 seconds)
    There are 14880 solutions when the 2 peg is open first (took 2.25264 seconds)
    There are 14880 solutions when the 6 peg is open first (took 2.23694 seconds)
    There are 14880 solutions when the 11 peg is open first (took 2.21811 seconds)
    There are 14880 solutions when the 13 peg is open first (took 2.20756 seconds)
    There are 14880 solutions when the 9 peg is open first (took 2.2068 seconds)
    There are 1550 solutions when the 4 peg is open first (took 1.09297 seconds)
    There are 1550 solutions when the 7 peg is open first (took 1.09247 seconds)
    There are 1550 solutions when the 8 peg is open first (took 1.08851 seconds)
    There are 85258 solutions when the 3 peg is open first (took 8.52694 seconds)
    There are 85258 solutions when the 5 peg is open first (took 8.56293 seconds)
    There are 85258 solutions when the 12 peg is open first (took 8.49536 seconds)

