char board[][];
int boardSize = 3;
char playerSide = 'X';
char aiSide = 'O';
char startingSide = playerSide;
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
  drawGui();
  if (winner == 0)
  {
    winner = getWinner();
    if (players == 1)
    {
      if (currentSide == aiSide) doAiMove(); else delayTimer = millis();
    }
    if (winner == 'X') scoreX++;
    if (winner == 'O') scoreO++;
  }
}
