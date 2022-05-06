char currentSide;
int players = 2; // 2 is for multiplayer, 1 is against AI, 0 is for screensaver
int scoreX = 0;
int scoreO = 0;

void doMove(int x, int y)
{
  board[x][y] = currentSide;
  
  if (currentSide == 'X') currentSide = 'O';
  else if (currentSide == 'O') currentSide = 'X';
}
