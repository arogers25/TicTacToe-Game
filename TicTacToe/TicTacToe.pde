int gridAmount = 3; // How many squares the play grid has
int gridSize = 0; // The size of the grid boxes
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

void drawGrid(int x, int y, int w) // Leave x and y at 0 and w as width for fullscreen
{
  stroke(200);
  strokeWeight(5.0);
  gridSize = w / gridAmount;
  for (int i = 1; i < gridAmount; i++)
  {
    line(x, y + (i * gridSize), x + w, y + (i * gridSize));
    line(x + (i * gridSize), y, x + (i * gridSize), y + w);
  }
}

void draw()
{
  background(255);
  drawGrid(100, 100, 300);
}
