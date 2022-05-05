char board[][];
int boardSize = 3;
char startingSide = 'X';
char currentSide;

void setup()
{
  size(700, 700);
  setupBoard(0, 0, width);
}

void draw()
{
  background(255);
  drawBoard();
}
