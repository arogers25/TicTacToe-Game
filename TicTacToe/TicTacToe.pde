int gridSize = 3; // The squares of the play grid
int boxSize = 0; // The size of the grid boxes
int grid[][]; // The array of the game pieces

void setup()
{
  size(700, 700);
  grid = new int[gridSize][gridSize];
}

void drawGrid(int x, int y, int w, int size)
{
  boxSize = w / gridSize;
}

void draw()
{
}
