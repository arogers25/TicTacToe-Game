char board[][];
int boardSize = 3;
char startingSide = 'X';
char winner = 0;
PFont mainFont;
// These can be moved later

void setup()
{
  size(700, 700);
  setupBoard(width / 4, width / 4, width / 2);
  strokeCap(SQUARE);
  textAlign(CENTER, CENTER);
  mainFont = createFont("Arial", 32);
  textFont(mainFont);
}

void draw()
{
  background(255);
  drawBoard();
  //drawPiece(0, 0, 'O', true);
}
