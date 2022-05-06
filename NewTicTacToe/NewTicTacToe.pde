char board[][];
int boardSize = 3;
char startingSide = 'X';
char aiSide = 'O';
char winner = 0;
PFont mainFont;
// These can be moved later

void setup()
{
  size(900, 900);
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
  drawGui();
  if (players == 1) doAiMove();
  if (winner == 0)
  {
    winner = getWinner();
    if (winner == 'X') scoreX++;
    if (winner == 'O') scoreO++;
  }
}
