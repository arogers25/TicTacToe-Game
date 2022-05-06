char currentSide;

void doMove(int x, int y)
{
  board[x][y] = currentSide;
  
  if (currentSide == 'X') currentSide = 'O';
  else if (currentSide == 'O') currentSide = 'X';
}
