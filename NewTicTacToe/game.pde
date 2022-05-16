char currentSide;
int players = 2; // 2 is for multiplayer, 1 is against AI, 0 is for screensaver
int movesMade = 0;
int scoreX = 0;
int scoreO = 0;

void switchSides()
{  
  if (currentSide == 'X') currentSide = 'O';
  else if (currentSide == 'O') currentSide = 'X';
}

void doMove(int x, int y)
{
  board[x][y] = currentSide;
  movesMade++;
  switchSides();
}

void resetScore() // This is a seperate function to save time
{
  scoreX = 0;
  scoreO = 0;
}

ArrayList<int[]> getEmptyPlaces()
{
  ArrayList<int[]> emptyPlaces = new ArrayList<int[]>();
  for (int x = 0; x < boardSize; x++)
  {
    for (int y = 0; y < boardSize; y++)
    {
      if (board[x][y] == 0)
      {
        emptyPlaces.add(new int[]{x, y});
      }
    }
  }
  return emptyPlaces;
}

char getRowWinner()
{
  for (int y = 0; y < boardSize; y++)
  {
    boolean winnerFound = false;
    for (int x = 0; x < boardSize; x++)
    {
      if (board[0][y] != board[x][y] || board[x][y] == 0)
      {
        winnerFound = false; // If there is a move on the row that is not the same as every other or is empty, break the loop and go to the next Y
        break;
      }
      winnerFound = true;
    }
    if (winnerFound) // If this row has no empty pieces or only has 1 side with all the moves on it
    {
      return board[0][y]; // Every piece on the row is the same if it is won so it doesn't matter what X the grid is returned at
    }
  }
  return 0;
}

char getColumnWinner()
{
  for (int x = 0; x < boardSize; x++)
  {
    boolean winnerFound = false;
    for (int y = 0; y < boardSize; y++)
    {
      if (board[x][0] != board[x][y] || board[x][y] == 0)
      {
        winnerFound = false; // If there is a move on the row that is not the same as every other or is empty, break the loop and go to the next X
        break;
      }
      winnerFound = true;
    }
    if (winnerFound) // If this row has no empty pieces or only has 1 side with all the moves on it
    {
      return board[x][0]; // Every piece on the row is the same if it is won so it doesn't matter what Y the grid is returned at
    }
  }
  return 0;
}

char getWinner()
{
  if (getRowWinner() != 0) return getRowWinner();
  if (getColumnWinner() != 0) return getColumnWinner();

  boolean diagWon = true, reverseDiagWon = true;
  for (int i = 0; i < boardSize; i++) // Check diagonal winners
  {
    if (board[0][0] != board[i][i]) 
    {
      diagWon = false;
    }
    if (board[0][boardSize - 1] != board[i][(boardSize - 1) - i])
    {
      reverseDiagWon = false;
    }
  }
  if (diagWon) return board[0][0];
  if (reverseDiagWon) return board[0][boardSize - 1];
  if (getEmptyPlaces().size() == 0) return 'T';

  return 0;
}
