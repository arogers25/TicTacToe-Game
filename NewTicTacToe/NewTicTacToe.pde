char board[][];
int boardSize = 3;
char playerSide = 'X';
char aiSide = 'O';
char startingSide = playerSide;
char winner = 0;
PFont mainFont;
int state = 0; // 0 is for menu, 1 is for in game
// These can be moved later

void setup()
{
  size(900, 900);
  buttonWidth = width / 5;
  buttonHeight = width * 0.05;
  // Fix board and GUI scaling so it can work properly without being in square
  setupBoard(width / 4, width / 4, width / 2);
  strokeCap(SQUARE);
  textAlign(CENTER, CENTER);
  mainFont = createFont("Arial", 32);
  textFont(mainFont);
}

void draw()
{
  background(255);
  exitButton = button("Exit", width - buttonWidth - 10, 10, buttonWidth, buttonHeight, color(255, 0, 0), color(128, 0, 0));
  switch (state)
  {
  case 0:
    {
      drawMenu();
      fill(0);
      //text("Menu", width / 2, height / 2);
      break;
    }
  case 1:
    {
      drawBoard();
      drawGui();
      if (winner == 0)
      {
        winner = getWinner();
        if (players == 1)
        {
          if (currentSide == aiSide) doAiMove(); 
          else delayTimer = millis();
        }
        if (winner == 'X') scoreX++;
        if (winner == 'O') scoreO++;
      }
      break;
    }
  }
}
