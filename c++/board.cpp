/* board.cpp */

#include <board.h>
#include <iostream>
#include <sstream>

namespace WilliamGMyers
{

    // from, to, over
    const int moveArray[][3] =
    {
        { 0, 3, 1 },
        { 0, 5, 2 },
        { 1, 8, 4 },
        { 1, 6, 3 },
        { 2, 7, 4 },
        { 2, 9, 5 },
        { 3, 0, 1 },
        { 3, 10, 6 },
        { 3, 12, 7 },
        { 3, 5, 4 },
        { 4, 11, 7 },
        { 4, 13, 8 },
        { 5, 0, 2 },
        { 5, 14, 9 },
        { 5, 12, 8 },
        { 5, 3, 4 },
        { 6, 1, 3 },
        { 6, 8, 7 },
        { 7, 2, 4 },
        { 7, 9, 8 },
        { 8, 1, 4 },
        { 8, 6, 7 },
        { 9, 2, 5 },
        { 9, 7, 8 },
        { 10, 3, 6 },
        { 10, 12, 11 },
        { 11, 4, 7 },
        { 11, 13, 12 },
        { 12, 3, 7 },
        { 12, 5, 8 },
        { 12, 10, 11 },
        { 12, 14, 13 },
        { 13, 4, 8 },
        { 13, 11, 12 },
        { 14, 5, 9 },
        { 14, 12, 13 }
    };

    // Constructors
    Board::Board(unsigned int openPos)
    :d_remaining(NODE_COUNT - 1)
    {
        for(unsigned int i = 0; i < NODE_COUNT; ++i)
        {
            d_nodes[i] = i != openPos;
        }
    }

    unsigned int Board::remaining()
    {
        return d_remaining;
    }

    void Board::findMoves(std::vector<int>& moves)
    {
        for(unsigned int i = 0; i < MOVE_COUNT; ++i)
        {
            bool fromNode = d_nodes[moveArray[i][0]];
            bool toNode = d_nodes[moveArray[i][1]];
            bool overNode = d_nodes[moveArray[i][2]];

            if(fromNode && !toNode && overNode)
            {
                moves.push_back(moveArray[i][0]);
                moves.push_back(moveArray[i][1]);
                moves.push_back(moveArray[i][2]);
            }
        }
    }

    void Board::move(unsigned int from, unsigned int to, unsigned int over)
    {
        d_nodes[from] = false;
        d_nodes[to] = true;
        d_nodes[over] = false;

        std::stringstream ss;
        ss << "from: " << from << ", to: " << to << ", over: " << over;

        d_history.push_back(ss.str());
        d_remaining--;
    }

    void Board::rewind(unsigned int from, unsigned int to, unsigned int over)
    {
        d_nodes[from] = true;
        d_nodes[to] = false;
        d_nodes[over] = true;
        d_history.pop_back();
        d_remaining++;
    }

    void Board::printHistory()
    {
        for(std::vector<std::string>::const_iterator it = d_history.begin();
            it != d_history.end(); ++it)
        {
            std::cout << *it << std::endl;
        }
    }


}
