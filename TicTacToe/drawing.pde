int gridSize = 0; // The size of the grid boxes
int lineGap = 0; // For piece scaling
PFont gameFont;

void drawX(int x, int y)
{
  stroke(color(255, 0, 0));
  strokeWeight(8.0);
  line(x, y, x + lineGap, y + lineGap);
  line(x, y + lineGap, x + lineGap, y);
}

void drawO(int x, int y)
{
  noFill();
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
