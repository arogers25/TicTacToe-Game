int gridAmount = 3; // How many squares the play grid has
int gridSize = 0; // The size of the grid boxes
int lineGap = 0; // For piece scaling
int gridPosX = 100, gridPosY = 100;

int grid[][]; // The array of the game pieces
int team = 1; // X is 1, O is 2
boolean multiPlayer = true;

void setup()
{
  size(700, 700);
  grid = new int[gridAmount][gridAmount];
  strokeCap(SQUARE); // Makes lines square instead of rounded
  noFill();
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

void drawMove(int x, int y, int team) // Draws move at coordinates on board
{
  if (team == 1)
  {
    drawX((gridPosX + lineGap / 2) + x * gridSize, (gridPosY + lineGap / 2) + y * gridSize);
  } else if (team == 2)
  {
    drawO((gridPosX + lineGap / 2) + x * gridSize, (gridPosY + lineGap / 2) + y * gridSize);
  }
  // If the team is not 1 or 2 draw nothing
}

void draw()
{
  background(255);
  drawGrid(300);
  drawMove(1, 0, 1);
}
