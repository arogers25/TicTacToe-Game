# TicTacToe-Game
CS20 Tic Tac Toe

## Difficulty
There are 3 difficulties: "Easy", "Medium", and "Impossible".
"Easy" selects a random move on the board, "Medium" has a 50/50 chance between a random move and a perfect move, and "Impossible" will always play a perfect move with the Minimax algorithm

## Minimax Algorithm with alpha-beta pruning
The Minimax Algorithm decides how to pick a move by playing out the game for both sides to its depth / to game completion and assigning a score to each option.
It returns +10 if the move gives the AI a win, -10 if the player gets a win, and 0 if it is a tie.
Alpha-beta pruning is used to speed up the algorithm by ending the check if the score is worse than one that was already checked.

Resources that helped me implement minimax were:

https://www.youtube.com/watch?v=l-hh51ncgDI

https://www.youtube.com/watch?v=trKjYdBASyQ

https://www.freecodecamp.org/news/how-to-make-your-tic-tac-toe-game-unbeatable-by-using-the-minimax-algorithm-9d690bad4b37/

https://en.wikipedia.org/wiki/Minimax
