int gridAmount = 3; // How many squares the play grid has
int gridPosX = 150, gridPosY = 150; // Set both to 0 for fullscreen
int grid[][]; // The array of the game pieces

int getRowWinner()
{
  for (int y = 0; y < gridAmount; y++)
  {
    int winnerX = -1;
    for (int x = 0; x < gridAmount; x++)
    {
      if (grid[0][y] != grid[x][y] || grid[x][y] == 0)
      {
        winnerX = -1; // If there is a move on the row that is not the same as every other or is empty, break the loop and go to the next Y
        break;
      }
      winnerX = x;
    }
    if (winnerX != -1) // If this row has no empty pieces or only has 1 side with all the moves on it
    {
      return grid[0][y]; // Every piece on the row is the same if it is won so it doesn't matter what X the grid is returned at
    }
  }
  return 0;
}

int getColumnWinner()
{
  for (int x = 0; x < gridAmount; x++)
  {
    int winnerY = -1;
    for (int y = 0; y < gridAmount; y++)
    {
      if (grid[x][0] != grid[x][y] || grid[x][y] == 0)
      {
        winnerY = -1;
        break;
      }
      winnerY = y;
    }
    if (winnerY != -1)
    {
      return grid[x][0];
    }
  }
  return 0;
}

int getDiagWinners()
{
  boolean diagWon = true;
  boolean reverseDiagWon = true;
  for (int i = 0; i < gridAmount; i++)
  {
    if (grid[0][0] != grid[i][i]) 
    {
      diagWon = false;
    }
    if (grid[0][gridAmount - 1] != grid[i][(gridAmount - 1) - i])
    {
      reverseDiagWon = false;
    }
  }
  if (diagWon) return grid[0][0];
  if (reverseDiagWon) return grid[0][gridAmount - 1];
  return 0; // Return 0 if there are no winners on the diagonal or reverse diagonal
}

void getWinner()
{
  if (getRowWinner() > 0) winner = getRowWinner();
  if (getColumnWinner() > 0) winner = getColumnWinner();
  if (getDiagWinners() > 0) winner = getDiagWinners();
  if (movesPlayed == (gridAmount * gridAmount) && winner == 0) winner = 3; // If all of the moves have been played and there is no winner it is a tie
}
