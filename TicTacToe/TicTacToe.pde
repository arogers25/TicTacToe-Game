int gridAmount = 3; // How many squares the play grid has
int gridSize = 0; // The size of the grid boxes
int lineGap = 0; // For piece scaling
int gridPosX = 100, gridPosY = 100; // Set both to 0 for fullscreen

int grid[][]; // The array of the game pieces
int team = 1; // X is 1, O is 2
int winner = 0; // The side that has won the game, 3 is tie
boolean multiPlayer = true;
int movesPlayed = 0;

void setup()
{
  size(700, 700);
  grid = new int[gridAmount][gridAmount];
  strokeCap(SQUARE); // Makes lines square instead of rounded
  noFill();
}

void drawX(int x, int y)
{
  stroke(color(255, 0, 0));
  strokeWeight(8.0);
  line(x, y, x + lineGap, y + lineGap);
  line(x, y + lineGap, x + lineGap, y);
}

void drawO(int x, int y)
{
  stroke(color(0, 0, 255));
  strokeWeight(8.0);
  circle(x + lineGap / 2, y + lineGap / 2, lineGap); // Add position divided by 2 to x and y so the circle draws centered
}

void drawMove(int x, int y, int moveTeam) // Draws move at coordinates on board
{
  if (moveTeam == 1)
  {
    drawX((gridPosX + lineGap / 2) + x * gridSize, (gridPosY + lineGap / 2) + y * gridSize);
  } else if (moveTeam == 2)
  {
    drawO((gridPosX + lineGap / 2) + x * gridSize, (gridPosY + lineGap / 2) + y * gridSize);
  }
  // If the team is not 1 or 2 draw nothing
}

void drawGrid(int size) // Set size to width for fullscreen
{
  stroke(200);
  strokeWeight(5.0);
  gridSize = size / gridAmount;
  lineGap = gridSize / 2;
  for (int i = 1; i < gridAmount; i++)
  {
    line(gridPosX, gridPosY + (i * gridSize), gridPosX + size, gridPosY + (i * gridSize));
    line(gridPosX + (i * gridSize), gridPosY, gridPosX + (i * gridSize), gridPosY + size);
  }
  for (int x = 0; x < gridAmount; x++)
  {
    for (int y = 0; y < gridAmount; y++)
    {
      if (grid[x][y] > 0)
      {
        drawMove(x, y, grid[x][y]);
      }
    }
  }
}

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
    if (winnerX != -1) // If this row has no empty pieces or only has 1 team with all the moves on it
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
  if (movesPlayed == gridAmount * gridAmount) winner = 3; // If all of the moves have been played and there is no winner it is a tie
}

void doMove(int x, int y)
{
  if (grid[x][y] == 0)
  {
    movesPlayed++;
    grid[x][y] = team;
    getWinner();
    team = (team == 1 ? 2 : 1);
  }
}

void draw()
{
  println(getDiagWinners());
  background(255);
  drawGrid(300);
}

void mousePressed()
{
  if (winner > 0) return; // Only allow input if the game does not have a winner
  
  int mouseGridX = (mouseX - gridPosX) / gridSize; // The position of the mouse on the grid
  int mouseGridY = (mouseY - gridPosY) / gridSize;
  if (mouseGridX >= 0 && mouseGridX < gridAmount && mouseGridY >= 0 && mouseGridY < gridAmount) // If the mouse is in bounds of the grid
  {
    if (mouseButton == LEFT)
    {
      doMove(mouseGridX, mouseGridY);
    }
    if (mouseButton == RIGHT)
    {
      grid[mouseGridX][mouseGridY] = grid[mouseGridX][mouseGridY] == 1 ? 2 : 1;
    }
  }
}
