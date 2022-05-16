boolean multiPlayerButton = false;
boolean singlePlayerButton = false;
boolean startGameButton = false;

void drawMenu()
{
  //Make all these positions and sizes dynamic
  singlePlayerButton = button("1 Player Mode", (width / 2) - 210, (height / 2) - 100, 200, 50, players == 1 ? color(150) : color(210), color(175));
  multiPlayerButton = button("2 Player Mode", (width / 2) + 10, (height / 2) - 100, 200, 50, players == 2 ? color(150) : color(210), color(175));
  startGameButton = button("Start", (width / 2) - 50, (height / 2) - 25, 100, 50, color(210), color(175));
}

void menuInput()
{
  if (singlePlayerButton)
  {
    players = 1;
    //setupBoard(boardX, boardY, boardWidth);
  }
  if (multiPlayerButton)
  {
    players = 2;
  }
  if (startGameButton)
  {
    resetScore();
    setupBoard(boardX, boardY, boardWidth);
    state = 1;
  }
}
