char board[][];
int boardSize = 3;
char startingSide = 'X';
char currentSide;

void setup()
{
  size(700, 700);
  setupBoard();
}

void draw()
{
  background(255);
  drawBoard();
}
